module Interp where

import Declare
import Prelude hiding (LT, GT, EQ)
import Data.Maybe (fromJust)
import Parser (parseExpr, parseProg)
import Data.List (elemIndex)
import Data.Graph (Vertex, Edge , buildG, topSort)

unary :: UnaryOp -> Value -> Value
unary Not (BoolV b) = BoolV (not b)
unary Neg (IntV i)  = IntV (-i)
unary _ _ = undefined

binary :: BinaryOp -> Value -> Value -> Value
binary Add  (IntV a)  (IntV b)  = IntV (a + b)
binary Sub  (IntV a)  (IntV b)  = IntV (a - b)
binary Mult (IntV a)  (IntV b)  = IntV (a * b)
binary Div  (IntV a)  (IntV b)  = IntV (a `div` b)
binary And  (BoolV a) (BoolV b) = BoolV (a && b)
binary Or   (BoolV a) (BoolV b) = BoolV (a || b)
binary GT   (IntV a)  (IntV b)  = BoolV (a > b)
binary LT   (IntV a)  (IntV b)  = BoolV (a < b)
binary LE   (IntV a)  (IntV b)  = BoolV (a <= b)
binary GE   (IntV a)  (IntV b)  = BoolV (a >= b)
binary EQ   a         b         = BoolV (a == b)
binary _ _ _ = undefined


-- Part I: Nameless Representation

evaluateT :: ExpT -> Value
evaluateT e = evalT e [] where
    evalT :: ExpT -> [ Value ] -> Value
    evalT (LitT n) env = n
    evalT (UnaryT op e1) env = unary op (evalT e1 env)
    evalT (BinaryT op e1 e2) env = binary op (evalT e1 env) (evalT e2 env)
    evalT (IfT cond e1 e2) env = 
      case evalT cond env of
        IntV n -> undefined -- condition of if statement should be a boolean
        BoolV b -> if b then evalT e1 env else evalT e2 env
    evalT (VarT i) env = env!!i
    evalT (DeclT e1 e2) env = evalT e2 env' where
      env' = (evalT e1 env):env


-- | Evaluating nameless representation
--
-- >>> tcalc "if (true) 1; else 3"
-- 1
--
-- >>> tcalc "var x = 5; var y = x + 3; y + 2"
-- 10
--
-- >>> tcalc "var x = 5; var y = 6; var z = 4; y + x + z"
-- 15
tcalc :: String -> Value
tcalc = evaluateT . convert . parseExpr

-- Part II & III: Top level functions 

type Binding = (String, Value)
type Env = [Binding]

execute :: Program -> Value
execute (Program funEnv main) = evaluate main [] funEnv



-- | Execution with environment
--
-- Examples:
--
-- >>> execute prog1
-- 5
--
-- >>> execute prog2
-- 5
evaluate :: Exp -> Env -> FunEnv -> Value
evaluate (Lit n) env funEnv = n
evaluate (Unary op e) env funEnv = unary op (evaluate e env funEnv)
evaluate (Bin op e1 e2) env funEnv = binary op (evaluate e1 env funEnv) (evaluate e2 env funEnv)
evaluate (If cond e1 e2) env funEnv = 
  case evaluate cond env funEnv of
        IntV n -> error ((show cond) ++ " is not a boolean.") -- condition of if statement should be a boolean
        BoolV b -> if b then evaluate e1 env funEnv  else evaluate e2 env funEnv 
evaluate (Var varname) env funEnv =
  case lookup varname env of
    Just n -> n
    Nothing -> error ("Variable " ++ varname ++ " not declared.")
evaluate (Decl varname e1 body) env funEnv = evaluate body env' funEnv where
  env' = (varname, evaluate e1 env funEnv):env
evaluate (Call funcname argExps) env funEnv =
  case lookup funcname funEnv of
    Just (Function params body) -> evaluate body env' funEnv where
      paramNames = map fst params -- take the first element of each tuple in the parameter list (i.e. extract the parameter names)
      args = map (\e -> evaluate e env funEnv) argExps -- evalaute the arguments
      newVariables = zip paramNames args -- list of new variables to be inserted to the variable environment
      env' = newVariables ++ env
    Nothing -> error ("Function " ++ funcname ++ " not declared.")



-- | Function substitution
--
-- Examples:
--
-- >>> fsubst ("absolute", Function [("x",TInt)] (If (Bin GT (Var "x") (Lit (IntV 0))) (Var "x") (Unary Neg (Var "x")))) (Call "absolute" [Lit (IntV (-5))])
-- var x = -5; if (x > 0) x; else -x
--
-- >>> fsubst ("absolute", Function [("x",TInt)] (If (Bin GT (Var "x") (Lit (IntV 0))) (Var "x") (Unary Neg (Var "x")))) (Call "absolute" [Call "absolute" [Lit (IntV (-5))]])
-- var x = var x = -5; if (x > 0) x; else -x; if (x > 0) x; else -x
--
-- (Although the pretty-printing seems weird, the expression above is valid. To make it more readable,
--  you can add a pair of parentheses yourself: var x = (var x = -5; if (x > 0) x; else -x); if (x > 0) x; else -x  )

fsubst :: (String, Function) -> Exp -> Exp
fsubst (f, Function xs body) (Lit n) = Lit n
fsubst (f, Function xs body) (Unary op e1) = Unary op (fsubst (f, Function xs body) e1)
fsubst (f, Function xs body) (Bin op e1 e2) = Bin op (fsubst (f, Function xs body) e1) (fsubst (f, Function xs body) e2)
fsubst (f, Function xs body) (If cond e1 e2) = If (fsubst (f, Function xs body) cond) (fsubst (f, Function xs body) e1) (fsubst (f, Function xs body) e2)
fsubst (f, Function xs body) (Var varname) = Var varname
fsubst (f, Function xs body) (Decl varname e1 e2) = Decl varname (fsubst (f, Function xs body) e1) (fsubst (f, Function xs body) e2)
fsubst (f, Function xs body) (Call funcname args) = if f == funcname then fsubst_aux param_argExp_pair body else Call funcname substitutedArgExps where
  paramNames = map fst xs
  substitutedArgExps = map (fsubst (f, Function xs body)) args -- the function calls to f within the original argument expressions are expanded with the function body
  param_argExp_pair = zip paramNames substitutedArgExps
  fsubst_aux :: [(String, Exp)] -> Exp -> Exp -- helps creating nested Decl expressions, in which each Decl corresponds to one argument in the function call
  fsubst_aux [] body = body
  fsubst_aux ((varname, argExp):xs) body = Decl varname argExp (fsubst_aux xs body)




-- | Execution with function substitution
--
-- Examples:
--
-- >>> execute' prog1
-- 5
--
-- >>> execute' prog2
-- 5

-- For any function A, B: if A calls B in A's function body, then A must be substituted to the main expression before B is substituted to the main expression
-- Since recursive functions are not supported, we may also think that any mutual recursive calls are not allowed
-- Then, we may model this problem to a graph problem: 
-- 1. We denote each function as a vertex, and the relation of "A calls B" be a directed edge from A to B in the graph: the graph is a directed graph
-- 2. We do not allow any form of recursion: the graph must be an acyclic graph
-- Since the graph will be a directed acyclic graph (DAG), we may use topological sort to find the appropriate order of executing fsubst
execute' :: Program -> Value
execute' (Program funEnv main) = evaluate' body' [] where
  -- Get all the edges
  getAllEdges :: FunEnv -> [Edge]
  getAllEdges [] = []
  getAllEdges (x:xs) = getEdges x ++ getAllEdges xs where
    -- Get the edges that starts from the function A in the argument
    getEdges :: (String, Function) -> [Edge]
    getEdges (funcname, Function params body) = map (\v -> (indexOfThisFunc, v)) (getEdges_aux body) where
      functionNames = map fst funEnv
      indexOfThisFunc = fromJust (elemIndex funcname functionNames) -- index of the function A given in the argument with respect to the function environment
      -- Get the list of indices of the functions that are called in the function A's body
      getEdges_aux :: Exp -> [Vertex]
      getEdges_aux (Lit n) = []
      getEdges_aux (Unary op e) = getEdges_aux e
      getEdges_aux (Bin op e1 e2) = getEdges_aux e1 ++ getEdges_aux e2
      getEdges_aux (If e1 e2 e3) = getEdges_aux e1 ++ getEdges_aux e2 ++ getEdges_aux e3
      getEdges_aux (Var v) = []
      getEdges_aux (Decl v e1 e2) = getEdges_aux e1 ++ getEdges_aux e2
      getEdges_aux (Call funcname_in args) = if funcname == funcname_in then [] else [fromJust (elemIndex funcname_in functionNames)] -- When a function calls itself, just return an empty list. (Recursion is not allowed)
  
  -- Construct a graph with all the edges 
  funcGraph = buildG verticesIndexBounds allEdges where
    verticesIndexBounds = (0, length funEnv - 1)
    allEdges = getAllEdges funEnv
  
  -- Do topological sort
  substitutionOrder = topSort funcGraph

  -- Substitute the functions in the topological order
  body' = fsubstall substitutionOrder main where
    fsubstall [] e = e
    fsubstall (x:xs) e = fsubstall xs e' where 
      e' = fsubst (funEnv!!x) e


evaluate' :: Exp -> Env -> Value
evaluate' (Lit n) env = n
evaluate' (Unary op e) env = unary op (evaluate' e env)
evaluate' (Bin op e1 e2) env = binary op (evaluate' e1 env) (evaluate' e2 env)
evaluate' (If e1 e2 e3) env =
  let BoolV test = evaluate' e1 env
  in if test
     then evaluate' e2 env
     else evaluate' e3 env
evaluate' (Var v) env = fromJust (lookup v env)
evaluate' (Decl v a b) env =
  let a' = evaluate' a env
      env' = (v, a') : env
  in evaluate' b env'
evaluate' _ _ = error "you are in trouble"
