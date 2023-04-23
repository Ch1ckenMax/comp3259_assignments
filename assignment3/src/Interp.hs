module Interp where

import Declare
import Prelude hiding (LT, GT, EQ)

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
binary LT   (IntV a)  (IntV b)  = BoolV (a < b)
binary LE   (IntV a)  (IntV b)  = BoolV (a <= b)
binary GE   (IntV a)  (IntV b)  = BoolV (a >= b)
binary GT   (IntV a)  (IntV b)  = BoolV (a > b)
binary EQ   a         b         = BoolV (a == b)
binary _ _ _ = undefined


-- Call-by-need evaluation

evaluate :: Exp -> Env -> (Value, Env)
evaluate (Lit n) env = (n, env)
evaluate (Unary op e1) env = let (e1result, e1env) = evaluate e1 env in (e1result, e1env)
evaluate (Bin op e1 e2) env =
    let (e1result, e1env) = evaluate e1 env in
        let (e2result, e2env) = evaluate e2 e1env in
            (binary op e1result e2result, e2env)
evaluate (If e1 e2 e3) env =
    case evaluate e1 env of
        (BoolV b, e1env) ->
            if b then 
                let (e2result, e2env) = evaluate e2 e1env in (e2result, e2env)
            else
                let (e3result, e3env) = evaluate e3 e1env in (e3result, e3env)
        _ -> (error "Non boolean in condition of if statement")
evaluate (Var varname) env =
    case lookup varname env of
        Just (Left (CExp e1 env')) -> (e1result, (varname, Right e1result): env) where e1result = fst (evaluate e1 env')
        Just (Right n) -> (n, env)
        Nothing -> error ("Variable " ++ varname ++ " not declared.")
-- Not using the environment from the evaluation of body. Otherwise, the lexical can be messed up. e.g.: var x = 2 + 5; (var x = 4; x) + x
evaluate (Decl varname vartype e1 body) env = (bodyResult, env) where 
    (bodyResult, bodyEnv) = evaluate body newEnv where 
        newEnv = (varname, Left (CExp e1 newEnv)):env
evaluate (Call f x) env = 
    case evaluate f env of
        (ClosureV (varname, vartype) body cenv, fenv) -> (bodyResult, fenv) where 
            (bodyResult, bodyEnv) = evaluate body closuredEnv where
                closuredEnv = (varname, Left (CExp x env)):cenv
        _ -> error ((show f) ++ " is not a function.")
evaluate (Fun (paramname, paramType) body) env = (ClosureV (paramname, paramType) body env, env)
evaluate (MultDecl funcList body) env = (bodyResult, env)
        where 
            -- Auxiliary function to help creating closures for the functions
            multDecl_aux :: [(String, Type, Exp)] -> Env -> Env
            multDecl_aux ((varname, vartype, e1):funcList) recursiveEnv = (varname, Left (CExp e1 recursiveEnv)):(multDecl_aux funcList recursiveEnv)
            multDecl_aux [] recursiveEnv = []

            recursiveEnv = multDecl_aux funcList (recursiveEnv ++ env) --The closures are cyclic, so mutual recursion is possible.
            (bodyResult, bodyEnv) = evaluate body recursiveEnv



execute :: Exp -> Value
execute e = fst (evaluate e [])
