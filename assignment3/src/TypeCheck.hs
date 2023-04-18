module TypeCheck where

import Declare
import Data.Foldable (for_)
import Prelude hiding (LT, GT, EQ)

type TEnv = [(String, Type)]

tunary :: UnaryOp -> Type -> Either String Type
tunary Neg TInt  = Right TInt
tunary Not TBool = Right TBool
tunary _ _ = Left "Type error in unary"

tbinary :: BinaryOp -> Type -> Type -> Either String Type
tbinary Add  TInt  TInt  = Right TInt
tbinary Sub  TInt  TInt  = Right TInt
tbinary Mult TInt  TInt  = Right TInt
tbinary Div  TInt  TInt  = Right TInt
tbinary And  TBool TBool = Right TBool
tbinary Or   TBool TBool = Right TBool
tbinary LT   TInt  TInt  = Right TBool
tbinary LE   TInt  TInt  = Right TBool
tbinary GE   TInt  TInt  = Right TBool
tbinary GT   TInt  TInt  = Right TBool
tbinary EQ t1 t2 | t1 == t2 = Right TBool
tbinary _ _ _ = Left "Type error in binary"

tcheck :: Exp -> TEnv -> Either String Type
tcheck (Lit (IntV _)) _ = Right TInt
tcheck (Lit (BoolV _)) _ = Right TBool
tcheck (Lit (ClosureV {})) _ = undefined
tcheck (Unary op e) env = do
  t <- tcheck e env
  tunary op t
tcheck (Bin op e1 e2) env = do
  t1 <- tcheck e1 env
  t2 <- tcheck e2 env
  tbinary op t1 t2
tcheck (If e1 e2 e3) env = do
  t1 <- tcheck e1 env
  t2 <- tcheck e2 env
  t3 <- tcheck e3 env
  if t1 /= TBool then Left "if-guard is not a boolean"
  else if t2 /= t3 then Left "if-arms have different types"
  else Right t2
tcheck (Var x) env =
  case lookup x env of
    Just t -> Right t
    Nothing -> Left $ "var " ++ x ++ " not found"
tcheck (Decl x t e body) env = do
  t' <- tcheck e ((x, t) : env)
  if t == t' then tcheck body ((x, t) : env)
  else Left "declaration type mismatch"
tcheck (Fun (x, t1) e) env = do
  t2 <- tcheck e ((x, t1) : env)
  Right $ TFun t1 t2
tcheck (Call e1 e2) env = do
  t1 <- tcheck e1 env
  t2 <- tcheck e2 env
  case t1 of TFun t3 t4 | t3 == t2 -> Right t4
             _ -> Left "failed function application"
tcheck (MultDecl xs body) env = error "TODO: Question 13"
