module TypeCheck where

import Declare
import Prelude hiding (LT, GT, EQ)


checkProgram :: Program -> Bool
checkProgram (Program fds main) = True


-- For assignment 2, we assume that the input program is always well-typed.

-- You do not need to do anything with this file for assignment 2.

-- We will implement a type checker in tutorial 5
-- and at that time you will need to modify this file.