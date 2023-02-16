module Interp where

import Parser
import Declare

-- | Factorial Function
--
-- >>> factorial 5
-- 120
--
-- >>> factorial 1
-- 1
--
-- >>> factorial 0
-- 1
--
-- >>> factorial 10
-- 3628800
--
-- >>> factorial 9
-- 362880
--
factorial :: Int -> Int
factorial 0 = 1 -- Base Case
factorial n = n * factorial (n - 1) -- Recursive Case

-- | Evaluation function
--
-- Examples:
--
-- >>> evaluate e1
-- 7
--
-- >>> evaluate e2
-- -4
--
-- >>> evaluate e3
-- 9
--
-- >>> evaluate e4
-- 2
--
-- >>> evaluate e5
-- 1
--
-- >>> evaluate e
-- 10
--
evaluate :: Exp -> Int
evaluate (Num n)     = n
evaluate (Add a b)   = evaluate a + evaluate b
evaluate (Sub a b)   = evaluate a - evaluate b
evaluate (Mult a b)  = evaluate a * evaluate b
evaluate (Div a b)   = evaluate a `div` evaluate b
evaluate (Power a b) = evaluate a ^ evaluate b
evaluate (Neg a)     = negate (evaluate a)
evaluate (Fact a)    = factorial (evaluate a)
evaluate (Mod a b)   = evaluate a `mod` evaluate b


-- | A simple calculator
--
-- Examples:
--
-- >>> calc "1 + 8 * 2"
-- 17
--
-- >>> calc "2 * (8 + -6) ^ 3"
-- 16
--
-- >>> calc "5! * 2 - 3 + 6 "
-- 243
--
-- >>> calc "- (6! + 2) % 7 * 9 "
-- -9
--
-- >>> calc "((5 + (5 ^ 2)) / (6 - (3 * 1)))"
-- 10
--
calc :: String -> Int
calc = evaluate . parseExpr


-- | Taming Eithers
--
-- Examples:
--
-- >>> evaluate2 (Add (Sub (Num 3) (Num 2)) (Mult (Num 2) (Num 3)))
-- Right 7
--
-- >>> evaluate2 (Div (Num 2) (Num 0))
-- Left "Divided by zero: 0"
--
-- >>> evaluate2 (Power (Num 2) (Num (-3)))
-- Left "To the power of a negative number: -3"
--
-- >>> evaluate2 (Fact (Sub (Num 2) (Num 3)))
-- Left "Factorial of a negative number: (2 - 3)"
--
-- >>> evaluate2 (Mod (Num 2) (Num 0))
-- Left "Divided by zero: 0"
--
-- >>> evaluate2 (Fact (Mod (Num 2) (Num 3)))
-- Right 2
evaluate2 :: Exp -> Either String Int
evaluate2 (Num n) = Right n
evaluate2 (Add a b) =
  case evaluate2 a of
    Left msg -> Left msg
    Right a' ->
      case evaluate2 b of
        Left msg -> Left msg
        Right b' -> Right (a' + b')
evaluate2 (Sub a b) =
  case evaluate2 a of
    Left msg -> Left msg
    Right a' ->
      case evaluate2 b of
        Left msg -> Left msg
        Right b' -> Right (a' - b')
evaluate2 (Mult a b) =
  case evaluate2 a of
    Left msg -> Left msg
    Right a' ->
      case evaluate2 b of
        Left msg -> Left msg
        Right b' -> Right (a' * b')
evaluate2 (Div a b) =
  case evaluate2 a of
    Left msg -> Left msg
    Right a' ->
      case evaluate2 b of
        Left msg -> Left msg
        Right 0  -> Left ("Divided by zero: " ++ show b) 
        Right b' -> Right (a' `div` b')
evaluate2 (Power a b) =
  case evaluate2 a of
    Left msg -> Left msg
    Right a' ->
      case evaluate2 b of
        Left msg -> Left msg
        Right b' | b' < 0    -> Left ("To the power of a negative number: " ++ show b)
                 | otherwise -> Right (a' ^ b')
evaluate2 (Neg a) =
  case evaluate2 a of
    Left msg -> Left msg
    Right a' -> Right (negate a')
evaluate2 (Fact a) = 
  case evaluate2 a of
    Left msg -> Left msg
    Right a' | a' < 0    -> Left ("Factorial of a negative number: " ++ show a)
             | otherwise -> Right (factorial a')
evaluate2 (Mod a b) = 
  case evaluate2 a of
    Left msg -> Left msg
    Right a' ->
      case evaluate2 b of
        Left msg -> Left msg
        Right 0  -> Left ("Divided by zero: " ++ show b)
        Right b' -> Right (a' `mod` b')


calc2 :: String -> Either String Int
calc2 = evaluate2 . parseExpr


-- | Monadic binding operation
--
-- Examples:
-- >>> flatMap (Right 3) (\n -> Right (n + 1))
-- Right 4
--
-- >>> flatMap (Left "bad things") (\n -> Right (n + 1))
-- Left "bad things"
flatMap :: Either a b -> (b -> Either a b) -> Either a b
flatMap (Left a) f = Left a
flatMap (Right a) f = f a



evaluate3 :: Exp -> Either String Int
evaluate3 (Num n) = Right n
evaluate3 (Add a b) = flatMap (evaluate3 a) (\a' -> flatMap (evaluate3 b) (\b' -> Right (a' + b')))
evaluate3 (Sub a b) = flatMap (evaluate3 a) (\a' -> flatMap (evaluate3 b) (\b' -> Right (a' - b')))
evaluate3 (Mult a b) = flatMap (evaluate3 a) (\a' -> flatMap (evaluate3 b) (\b' -> Right (a' * b')))
evaluate3 (Div a b) = flatMap (evaluate3 a) (\a' -> flatMap (evaluate3 b) (\b' -> if b' == 0 then Left ("Divided by zero: " ++ show b) else Right (a' `div` b')))
evaluate3 (Power a b) = flatMap (evaluate3 a) (\a' -> flatMap (evaluate3 b) (\b' -> if b' < 0 then Left ("To the power of a negative number: " ++ show b) else Right (a' ^ b')))
evaluate3 (Neg a) = flatMap (evaluate3 a) (\a' -> Right (negate a'))
evaluate3 (Fact a) = flatMap (evaluate3 a) (\a' -> if a' < 0 then Left ("Factorial of a negative number: " ++ show a) else Right (factorial a'))
evaluate3 (Mod a b) = flatMap (evaluate3 a) (\a' -> flatMap (evaluate3 b) (\b' -> if b' == 0 then Left ("Divided by zero: " ++ show b) else Right (a' `mod` b')))


-- | The neat calculator
--
-- Examples:
--
-- >>> calc3 "1 + 8 * 2"
-- Right 17
--
-- >>> calc3 "2 * (8 + -6) ^ 3"
-- Right 16
--
-- >>> calc3 "2 * (4 - 2) / (8 - 8)"
-- Left "Divided by zero: (8 - 8)"
--
-- >>> calc3 "2 * (4 - 2) ^ (6 - 8)"
-- Left "To the power of a negative number: (6 - 8)"
-- 
-- >>> calc3 "(8 + 4) % (6 - 6)"
-- Left "Divided by zero: (6 - 6)"
-- 
-- >>> calc3 "2 * (1 - 3)!"
-- Left "Factorial of a negative number: (1 - 3)"
calc3 :: String -> Either String Int
calc3 = evaluate3 . parseExpr


-- | Eliminating zeros
--
-- Examples:
--
-- >>> elim0 (Mult (Num 3) (Num 0))
-- 0
--
-- >>> elim0 (Mult (Num 3) (Num 2))
-- (3 * 2)
--
-- >>> elim0 (Add (Num 4) (Neg (Mult (Num 3) (Num 0))))
-- 4
--
-- >>> elim0 (Add (Fact (Num 1)) (Mod (Mult (Num 23) (Mult (Num 0) (Num 10))) (Num 0)))
-- (1 ! )
elim0 :: Exp -> Exp
elim0 (Num n) = Num n
elim0 (Add a b) =
  case elim0 a of
    Num 0 -> b
    dummy1 -> case elim0 b of
        Num 0 -> a
        dummy2 -> Add a b
elim0 (Sub a b) =
  case elim0 b of
    Num 0 -> a
    dummy -> Sub a b
elim0 (Mult a b) =
  case elim0 a of
    Num 0 -> Num 0
    dummy1 -> case elim0 b of
        Num 0 -> Num 0
        dummy2 -> Mult a b
elim0 (Div a b) =
  case elim0 a of
    Num 0 -> Num 0
    dummy -> Div a b
elim0 (Power a b) =
  case elim0 a of
    Num 0 -> Num 0
    dummy1 -> case elim0 b of
        Num 0 -> Num 1
        dummy2 -> Power a b
elim0 (Neg a) =
  case elim0 a of
    Num 0 -> Num 0
    dummy -> Neg a
elim0 (Fact a) = Fact a
elim0 (Mod a b) =
  case elim0 a of
    Num 0 -> Num 0
    dummy -> Mod a b

calc4 :: String -> Either String Int
calc4 = evaluate3 . elim0 . parseExpr
