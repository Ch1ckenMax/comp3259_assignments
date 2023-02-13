module Interp where

import Parser
import Declare


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
evaluate :: Exp -> Int
evaluate (Num n)     = n
evaluate (Add a b)   = evaluate a + evaluate b
evaluate (Sub a b)   = evaluate a - evaluate b
evaluate (Mult a b)  = evaluate a * evaluate b
evaluate (Div a b)   = evaluate a `div` evaluate b
evaluate (Power a b) = evaluate a ^ evaluate b
evaluate (Neg a)     = negate (evaluate a)
evaluate _ = error "TODO: Question 3"


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
-- >> calc "- (6! + 2) % 7 * 9 "
-- -9
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
evaluate2 _ = error "TODO: Question 4"


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
flatMap = error "TODO : Question 5"


evaluate3 :: Exp -> Either String Int
evaluate3 = error "TODO: Question 6"


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
elim0 = error "TODO: Question 7"


calc4 :: String -> Either String Int
calc4 = evaluate3 . elim0 . parseExpr
