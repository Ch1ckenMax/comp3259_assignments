module Interp where

import Declare
import Prelude hiding (LT, GT, EQ)
import Data.Maybe (fromJust)
import Parser (parseExpr, parseProg)

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
evaluate = error "TODO: Question 5"


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
fsubst (f, Function xs body) e = error "TODO: Question 6"


-- | Execution with function substitution
--
-- Examples:
--
-- >>> execute' prog1
-- 5
--
-- >>> execute' prog2
-- 5

execute' :: Program -> Value
execute' (Program funEnv main) = error "TODO: Question 7"


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
evaluate' _ _ = error "You are in trouble"
