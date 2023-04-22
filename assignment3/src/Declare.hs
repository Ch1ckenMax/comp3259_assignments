module Declare where

import Data.Maybe (fromJust)
import Prelude hiding (LT, GT, EQ)

data BinaryOp = Add | Sub | Mult | Div
              | GT  | LT  | LE   | GE  | EQ
              | And | Or
              deriving Eq

data UnaryOp = Neg
             | Not
             deriving Eq

data Type = TInt
          | TBool
          | TFun Type Type
          deriving Eq

data Value = IntV Int
           | BoolV Bool
           | ClosureV (String, Type) Exp Env
           deriving Eq

data Exp = Lit Value
         | Unary UnaryOp Exp
         | Bin BinaryOp Exp Exp
         | If Exp Exp Exp
         | Var String
         | Decl String Type Exp Exp
         | MultDecl [(String, Type, Exp)] Exp
         | Call Exp Exp
         | Fun (String, Type) Exp
         deriving Eq

data ClosureExp = CExp Exp Env deriving Eq

type Env = [(String, Either ClosureExp Value)]


-- Pretty printer

instance Show Type where
  show TInt = "Int"
  show TBool = "Bool"
  show (TFun t1 t2) = paren $ show t1 ++ " -> " ++ show t2

instance Show Value where
  show (IntV n) = show n
  show (BoolV True) = "true"
  show (BoolV False) = "false"
  show (ClosureV {}) = "closure"

instance Show Exp where
  show = showExp 0

showSep :: String -> [String] -> String
showSep _ [] = ""
showSep _ [e] = e
showSep sep (e:es) = e ++ sep ++ showSep sep es

showExp :: Int -> Exp -> String
showExp _ (Fun (n, t) e) =
  "function(" ++ n ++ ": " ++ show t ++ "): {\n  " ++ show e ++ "\n}"
showExp _ (Call f arg) = show f ++ "(" ++ show arg ++ ")"
showExp _ (Lit i) = show i
showExp _ (Var x) = x
showExp level (Decl x t a b) =
  if level > 0
    then paren result
    else result
  where
    result = "var " ++ x ++ ": " ++ show t ++ " = " ++ showExp 0 a ++ "; " ++ showExp 0 b
showExp level (MultDecl xs b) =
  if level > 0
    then paren result
    else result
  where
    result = "vars " ++ showSep "\nand " (map var xs) ++  ";\n" ++ showExp 0 b
    var (x, t, a) = x ++ ": " ++ show t ++ " = " ++ showExp 0 a
showExp level (If a b c) =
  if level > 0
    then paren result
    else result
  where
    result = "if (" ++ showExp 0 a ++ ") " ++ showExp 0 b ++ "; else " ++ showExp 0 c
showExp _ (Unary Neg a) =
  "-" ++
  showExp 99 a
showExp _ (Unary Not a) =
  "!" ++
  showExp 99 a
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



-- /* Program 1 */
-- var id = function(x: Int) {
--   x * 1
-- };
-- id(10)
prog1 :: Exp
prog1 = Decl "id" (TFun TInt TInt) (Fun ("x", TInt) (Bin Mult (Var "x") (Lit (IntV 1)))) (Call (Var "id") (Lit (IntV 10)))

-- /* Program 2 */
-- var mult = function(x: Int) { function(y: Int) {
--   x * y
-- }};
-- mult(3)(8)
prog2 :: Exp
prog2 = Decl "mult" (TFun TInt (TFun TInt TInt)) (Fun ("x", TInt) (Fun ("y", TInt) (Bin Mult (Var "x") (Var "y")))) (Call (Call (Var "mult") (Lit (IntV 3))) (Lit (IntV 8)))

-- /* Program 3 */
-- var x = 2;
-- var double = function(y: Int) {
--   x * y
-- };
-- var x = 4;
-- double(x)
prog3 :: Exp
prog3 = Decl "x" TInt (Lit (IntV 2)) (Decl "double" (TFun TInt TInt) (Fun ("y", TInt) (Bin Mult (Var "x") (Var "y"))) (Decl "x" TInt (Lit (IntV 4)) (Call (Var "double") (Var "x"))))

testprog = Decl "x" TInt (Bin Add (Lit (IntV 4)) (Lit (IntV 2))) (Bin Mult (Var "x") (Var "x"))

-- /* Program 4 */
-- var apply = function(f: Int -> Int) {
--   function(x: Int) {
--     f(x)
--   }
-- };
-- var double = function(x: Int) {
--   x * 2
-- };
-- apply(double)(10)
-- ```
prog4 :: Exp
prog4 = Decl "apply" (TFun (TFun TInt TInt) (TFun TInt TInt)) (Fun ("f", TFun TInt TInt) (Fun ("x", TInt) (Call (Var "f") (Var "x")))) (Decl "double" (TFun TInt TInt) (Fun ("x", TInt) (Bin Mult (Var "x") (Lit (IntV 2)))) (Call (Call (Var "apply") (Var "double")) (Lit (IntV 10))))

-- /* Program 5 */
-- var fib = function(n: Int) {
--   if (n <= 1) n;
--   else fib(n - 1) + fib(n - 2)
-- };
-- fib(2)
prog5 :: Exp
prog5 = Decl "fib" (TFun TInt TInt) (Fun ("n", TInt) (If (Bin LE (Var "n") (Lit (IntV 1))) (Var "n") (Bin Add (Call (Var "fib") (Bin Sub (Var "n") (Lit (IntV 1)))) (Call (Var "fib") (Bin Sub (Var "n") (Lit (IntV 2))))))) (Call (Var "fib") (Lit (IntV 2)))

-- /* Program 6 */
-- var fact = function(n: Int) {
--   if (n == 0) 1;
--   else n * fact(n - 1)
-- };
-- fact(5)
prog6 :: Exp
prog6 = Decl "fact" (TFun TInt TInt) (Fun ("n", TInt) (If (Bin EQ (Var "n") (Lit (IntV 0))) (Lit (IntV 1)) (Bin Mult (Var "n") (Call (Var "fact") (Bin Sub (Var "n") (Lit (IntV 1))))))) (Call (Var "fact") (Lit (IntV 5)))