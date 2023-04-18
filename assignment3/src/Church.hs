module Church where

import Prelude hiding (not, and, or, fst, snd, add, iszero, zero, one, two, three, mul, exp)

-- | Church Booleans
--
-- You will see that the above macros for true, false and iff are behaving as expected. 
-- For example, one may verify that iff true M N is equivalent to M, and iff false M N is equivalent to N.
--
-- >>> iff true "M" "N"
-- "M"
--
-- >>> iff false "M" "N"
-- "N"
--
-- Boolean arithmetic is also encodable in this way. For example, 
-- Boolean negation is essentially flipping the two “branches’ ’:
-- 
-- >>> iff (not true) "M" "N"
-- "N"


true  =  \t f -> t
false =  \t f -> f
iff   =  \b t f -> b t f

not b =  \t f -> b f t


-- | Church Booleans - Test
--
-- >>> iff (and true false) "get true" "get false"
-- "get false"
--
-- >>> iff (and true true) "get true" "get false"
-- "get true"
--
-- >>> iff (and false true) "get true" "get false"
-- "get false"
--
-- >>> iff (and false false) "get true" "get false"
-- "get false"
--
-- >>> iff (or true false) "get true" "get false"
-- "get true"
--
-- >>> iff (or true true) "get true" "get false"
-- "get true"
--
-- >>> iff (or false true) "get true" "get false"
-- "get true"
--
-- >>> iff (or false false) "get true" "get false"
-- "get false"
--
-- >>> iff (not (or true false)) "get true" "get false"
-- "get false"


and b1 b2 = \t f -> b1 (b2 t f) f
or  b1 b2 = \t f -> b1 t (b2 t f)

-- |- Church Pairs
--
-- For pairs, we need three operations mkpair, fst, and snd that obey the following behavior:
-- 
-- >>> fst (mkpair "M" "N")
-- "M"
--
-- >>> snd (mkpair "M" "N")
-- "N"

mkpair x y   = \s -> iff s x y
fst p        = p true
snd p        = p false


-- |- Church Triples
-- 
-- >>> fst3 (mktriple "M" "N" "P")
-- "M"
--
-- >>> snd3 (mktriple "M" "N" "P")
-- "N"
--
-- >>> thd3 (mktriple "M" "N" "P")
-- "P"

mktriple x y z = \s t -> s x (t y z)
fst3 p         = p true true -- or "p true false" is also fine. It does not matter.
snd3 p         = p false true
thd3 p         = p false false


-- | Church Numbers
--
-- >>> unchurch (add1 zero)
-- 1
--
-- >>> unchurch (add (church 23) (church 17))
-- 40
--
-- >>> iff (iszero (church 0)) "zero is zero" "zero is not zero"
-- "zero is zero"


church 0 = \f x -> x
church n = \f x -> f (church (n-1) f x)

unchurch cn = cn (+ 1) 0

zero   = \f x -> x
one    = \f x -> f x
two    = \f x -> f (f x)
three  = \f x -> f (f (f x))


add1 cn    = \f x -> f (cn f x)

add cn cm  = cm add1 cn

iszero cn  = cn (\x -> false) true




-- | Church Numbers - Multiplications and Exponentiations
--
-- >>> unchurch (mul (church 3) (church 4))
-- 12
--
-- >>> unchurch (exp (church 2) (church 3))
-- 8

mul cn cm  = error "TODO: Question 3"

exp cn cm  = error "TODO: Question 4"
