{
module Parser (parseExpr) where
import Data.Char (isDigit, isSpace, isAlpha)
import Prelude hiding (LT, GT, EQ)
import Declare
import Tokens
}


%name parser
%tokentype { Token }
%error { parseError }

%token
    var     { TokenVar }
    vars    { TokenVars }
    and     { TokenAAnd }
    id      { TokenSym $$ }
    int     { TokenInt $$ }
    Int     { TokenTInt }
    Bool    { TokenTBool }
    '+'     { TokenPlus }
    '-'     { TokenMinus }
    '*'     { TokenTimes }
    '/'     { TokenDiv }
    '('     { TokenLParen }
    ')'     { TokenRParen }
    '}'     { TokenRB }
    '{'     { TokenLB }
    ';'     { TokenSemiColon }
    ':'     { TokenColon }
    ','     { TokenComma }
    '='     { TokenEq }
    if      { TokenIf }
    else    { TokenElse }
    true    { TokenTrue }
    false   { TokenFalse }
    '<'     { TokenLT }
    '<='    { TokenLE }
    '>'     { TokenGT }
    '>='    { TokenGE }
    '=='    { TokenComp }
    '&&'    { TokenAnd }
    '!'     { TokenNot }
    '||'    { TokenOr }
    fun     { TokenFunc }
    '->'    { TokenArrow }

%right ';' else
%left '||'
%left '&&'
%nonassoc '=='
%nonassoc '>' '<' '>=' '<='
%left '+' '-'
%left '*' '/'
%left NEG NOT
%right '->'

%monad { Either String }


%%

Exp : fun '(' id ':' typ ')' '{' Exp '}' { Fun ($3, $5) $8 }
    | var id ':' typ '=' Exp ';' Exp     { Decl $2 $4 $6 $8 }
    | vars Vars ';'  Exp                 { MultDecl $2 $4 }
    | if '(' Exp ')' Exp ';' else Exp    { If $3 $5 $8 }
    | Exp '||' Exp                       { Bin Or $1 $3 }
    | Exp '&&' Exp                       { Bin And $1 $3 }
    | Exp '==' Exp                       { Bin EQ $1 $3 }
    | Exp '<' Exp                        { Bin LT $1 $3 }
    | Exp '>' Exp                        { Bin GT $1 $3 }
    | Exp '<=' Exp                       { Bin LE $1 $3 }
    | Exp '>=' Exp                       { Bin GE $1 $3 }
    | Exp '+' Exp                        { Bin Add $1 $3 }
    | Exp '-' Exp                        { Bin Sub $1 $3 }
    | Exp '*' Exp                        { Bin Mult $1 $3 }
    | Exp '/' Exp                        { Bin Div $1 $3 }
    | '-' Exp %prec NEG                  { Unary Neg $2 }
    | '!' Exp %prec NOT                  { Unary Not $2 }
    | App                                { $1 }

Vars : id ':' typ '=' Exp                { [($1, $3, $5)] }
     | Vars and id ':' typ '=' Exp       { ($3, $5, $7):$1 }

App : App '(' Exp ')'                    { Call $1 $3 }
    | id                                 { Var $1}
    | '(' Exp ')'                        { $2 }
    | int                                { Lit (IntV $1) }
    | true                               { Lit (BoolV True) }
    | false                              { Lit (BoolV False) }

typ : Int                                { TInt }
    | Bool                               { TBool }
    | typ '->' typ                       { TFun $1 $3 }

{

parseError _ = Left "Parse error"

parseExpr = parser . scanTokens

}
