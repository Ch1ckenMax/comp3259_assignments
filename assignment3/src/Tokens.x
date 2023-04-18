{
module Tokens where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-

  $white+                       ;
  "--".*                        ;
  var                           { \s -> TokenVar }
  vars                          { \s -> TokenVars }
  and                           { \s -> TokenAAnd }
  if                            { \s -> TokenIf }
  else                          { \s -> TokenElse }
  true                          { \s -> TokenTrue }
  false                         { \s -> TokenFalse }
  $digit+                       { \s -> TokenInt (read s) }
  \;                            { \s -> TokenSemiColon }
  \=                            { \s -> TokenEq }
  \+                            { \s -> TokenPlus }
  \-                            { \s -> TokenMinus }
  \*                            { \s -> TokenTimes }
  \/                            { \s -> TokenDiv }
  \^                            { \s -> TokenPow }
  \<                            { \s -> TokenLT }
  \<\=                          { \s -> TokenLE }
  \>\=                          { \s -> TokenGE }
  \>                            { \s -> TokenGT }
  \=\=                          { \s -> TokenComp }
  \&\&                          { \s -> TokenAnd }
  \|\|                          { \s -> TokenOr }
  \!                            { \s -> TokenNot }
  \(                            { \s -> TokenLParen }
  \)                            { \s -> TokenRParen }
  \{                            { \s -> TokenLB }
  \}                            { \s -> TokenRB }
  \,                            { \s -> TokenComma }
  \:                            { \s -> TokenColon }
  \-\>                          { \s -> TokenArrow }
  function                      { \s -> TokenFunc }
  Int                           { \s -> TokenTInt }
  Bool                          { \s -> TokenTBool }
  $alpha [$alpha $digit \_ \']* { \s -> TokenSym s }



{
-- The token type:
data Token = TokenInt Int
           | TokenSym String
           | TokenVar
           | TokenVars
           | TokenAAnd
           | TokenIf
           | TokenElse
           | TokenTrue
           | TokenFalse
           | TokenSemiColon
           | TokenPlus
           | TokenEq
           | TokenMinus
           | TokenTimes
           | TokenDiv
           | TokenPow
           | TokenLT
           | TokenLE
           | TokenGT
           | TokenGE
           | TokenComp
           | TokenAnd
           | TokenOr
           | TokenNot
           | TokenLParen
           | TokenRParen
           | TokenLB
           | TokenRB
           | TokenComma
           | TokenColon
           | TokenFunc
           | TokenTInt
           | TokenTBool
           | TokenArrow
           deriving (Eq,Show)

scanTokens = alexScanTokens
}
