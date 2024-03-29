module Declare where

import Data.Maybe (fromJust)
import Data.List (elemIndex)
import Prelude hiding (LT, GT, EQ)
import Control.Exception (ArrayException(IndexOutOfBounds))

data BinaryOp = Add | Sub | Mult | Div
              | GT  | LT  | LE   | GE  | EQ
              | And | Or
              deriving (Show, Eq)

data UnaryOp = Neg | Not
             deriving (Show, Eq)

data Value = IntV Int
           | BoolV Bool
           deriving Eq

instance Show Value where
  show (IntV n) = show n
  show (BoolV True) = "true"
  show (BoolV False) = "false"

data Type = TInt | TBool
          deriving Eq

instance Show Type where
  show TInt = "Int"
  show TBool = "Bool"

data Exp = Lit Value
         | Unary UnaryOp Exp
         | Bin BinaryOp Exp Exp
         | If Exp Exp Exp
         | Var String
         | Decl String Exp Exp
         | Call String [Exp]

-- Part I, Nameless Representation
type Index = Int

data ExpT = LitT Value
         | UnaryT UnaryOp ExpT
         | BinaryT BinaryOp ExpT ExpT
         | IfT ExpT ExpT ExpT
         | VarT Index
         | DeclT ExpT ExpT
         deriving Show

convert :: Exp -> ExpT
convert e_source = convert_aux e_source [] -- starts with an empty environment
  where
    convert_aux :: Exp -> [String] -> ExpT
    convert_aux (Lit n) env = LitT n
    convert_aux (Unary op e1) env = UnaryT op (convert_aux e1 env)
    convert_aux (Bin op e1 e2) env = BinaryT op (convert_aux e1 env) (convert_aux e2 env)
    convert_aux (If cond e1 e2) env = IfT (convert_aux cond env) (convert_aux e1 env) (convert_aux e2 env)
    convert_aux (Var varname) env = 
      case elemIndex varname env of
        Just n -> VarT n
        Nothing -> error ("Variable " ++ varname ++ " not declared.")
    convert_aux (Decl varname e1 body) env = DeclT (convert_aux e1 env) (convert_aux body (varname:env))


-- Note: You do not need to transform Call expression, since it is only useful 
-- for Part II & III. We don't assume Call expression input for this question, 
-- so you can do anything with it.

-- Part II & III, Adding top-level functions

data Program = Program FunEnv Exp

type FunEnv = [(String, Function)]

data Function = Function [(String, Type)] Exp


prog1 :: Program
prog1 =
  Program [ ("absolute",
            Function [("x",TInt)]
                      (If (Bin GT
                              (Var "x")
                              (Lit (IntV 0)))
                          (Var "x")
                          (Unary Neg (Var "x"))))
          , ("max",
            Function [("x",TInt), ("y",TInt)]
                      (If (Bin GT
                              (Var "x")
                              (Var "y"))
                          (Var "x")
                          (Var "y")))
          ] (Call "max" [Call "absolute" [Lit (IntV (-5))], Lit (IntV 4)])

prog2 :: Program
prog2 =
  Program [ ("max",
            Function [("x",TInt), ("y",TInt)]
                      (If (Bin GT
                              (Var "x")
                              (Var "y"))
                          (Var "x")
                          (Var "y")))
          , ("absolute",
            Function [("x",TInt)]
                      (Call "max" [Var "x", Unary Neg (Var "x")]))
          ] (Call "max" [Call "absolute" [Lit (IntV (-5))], Lit (IntV 4)])

testprog :: Program
testprog = Program [ ("C", Function [("x", TInt)] (Var "x") ) , ("B", Function [("x",TInt), ("y",TInt)] (If (Bin GT (Var "x") (Var "y")) (Call "C" [Var "x"]) (Var "y"))) , ("A", Function [("x",TInt)] (If (Bin GT (Var "x") (Call "C" [Lit (IntV 2)])) (Var "x") ( Call "B" [Var "x", Lit (IntV 0)] )))] (Call "A" [Lit (IntV 1)])


-- | Pretty-printing programs
--
-- Examples:
--
-- >>> show prog1
-- "function absolute(x: Int) {\n  if (x > 0) x; else -x\n}\nfunction max(x: Int, y: Int) {\n  if (x > y) x; else y\n}\nmax(absolute(-5), 4)"
--
-- >>> show prog2
-- "function max(x: Int, y: Int) {\n  if (x > y) x; else y\n}\nfunction absolute(x: Int) {\n  max(x, -x)\n}\nmax(absolute(-5), 4)"

instance Show Program where
  show (Program fenv e) = showSep "\n" (map showFun fenv) ++ "\n" ++ show e

showSep :: String -> [String] -> String
showSep sep [] = ""
showSep sep [s1] = s1
showSep sep (s1:s2:s) = s1 ++ sep ++ showSep sep (s2:s) -- case when there are more than 1 elements in s

-- | Pretty-printing functions
--
-- Examples:
--
-- >>> showFun ("foo", Function [("x",TInt), ("y",TInt)] (Bin Add (Var "x") (Var "y")))
-- "function foo(x: Int, y: Int) {\n  x + y\n}"

showFun :: (String, Function) -> String
showFun (funcName, Function params body) = "function " ++ funcName ++ "(" ++ showSep ", " paramList ++ ") {\n  " ++ show body ++ "\n}" where
  paramList = map (\(varname,vartype) -> varname ++ ": " ++ show vartype) params -- turn the parameter list to a string list, where each element is "varname: variable type"

instance Show Exp where
  show = showExp 0

showExp :: Int -> Exp -> String
showExp _ (Call f args) = f ++ "(" ++ showSep ", " (map show args) ++ ")"
showExp _ (Lit i) = show i
showExp _ (Var x) = x
showExp level (Decl x a b) =
  if level > 0
    then paren result
    else result
  where
    result = "var " ++ x ++ " = " ++ showExp 0 a ++ "; " ++ showExp 0 b
showExp level (If a b c) =
  if level > 0
    then paren result
    else result
  where
    result = "if (" ++ showExp 0 a ++ ") " ++ showExp 0 b ++ "; else " ++ showExp 0 c
showExp _ (Unary Neg a) = "-" ++ showExp 99 a
showExp _ (Unary Not a) = "!" ++ showExp 99 a
showExp level (Bin op a b) =
  showBin level (fromJust (lookup op levels)) a (fromJust (lookup op names)) b
  where
    levels =
      [ (Or, 1)
      , (And, 2)
      , (GT, 3)
      , (LT, 3)
      , (LE, 3)
      , (GE, 3)
      , (EQ, 3)
      , (Add, 4)
      , (Sub, 4)
      , (Mult, 5)
      , (Div, 5)
      ]
    names =
      [ (Or, "||")
      , (And, "&&")
      , (GT, ">")
      , (LT, "<")
      , (LE, "<=")
      , (GE, ">=")
      , (EQ, "==")
      , (Add, "+")
      , (Sub, "-")
      , (Mult, "*")
      , (Div, "/")
      ]

showBin :: Int -> Int -> Exp -> String -> Exp -> String
showBin outer inner a op b =
  if inner < outer
    then paren result
    else result
  where
    result = showExp inner a ++ " " ++ op ++ " " ++ showExp inner b

paren :: String -> String
paren x = "(" ++ x ++ ")"
