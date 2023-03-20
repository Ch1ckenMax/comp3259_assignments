{-# OPTIONS_GHC -w #-}
module Parser (parseExpr, parseProg) where
import Data.Char (isDigit, isSpace, isAlpha)
import Prelude hiding (LT, GT, EQ)
import Declare
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t5 t6 t7 t8 t9 t10 t11
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,211) ([0,0,0,18656,832,1,0,0,36352,13316,80,3840,48896,16384,0,0,0,1,0,0,0,14336,53266,64,18656,832,1,256,0,0,0,0,0,0,57344,16456,259,0,0,0,0,0,14336,53266,64,48128,64512,2,0,0,36352,13316,16,0,8,57344,16456,259,9088,3329,4,1166,4148,14336,53266,64,18656,832,32769,291,1037,36352,13316,16,4664,16592,57344,16456,259,9088,3329,4,1166,4148,0,0,0,15360,64512,2,1,0,0,4,0,3840,16128,0,60,124,61440,61440,0,960,0,0,15,0,15360,0,0,240,0,0,0,0,0,0,0,48,0,49152,0,0,1166,4148,0,15,191,32768,16,0,0,0,49152,49163,47,4664,16592,0,0,0,9088,3329,4,17344,12224,4096,0,0,32768,16,0,8192,0,36352,13316,16,3840,48896,0,1084,764,0,512,0,960,12224,49152,0,0,0,2,0,1,0,0,128,0,4664,16592,0,0,0,0,0,0,0,0,14336,53266,64,15360,64512,2,1264,3056,12288,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser1","%start_parser2","Program","Functions","Function","ids","typ","Exp","Exps","var","id","int","Int","Bool","'+'","'-'","'*'","'/'","'('","')'","'}'","'{'","';'","':'","','","'='","if","else","true","false","'<'","'<='","'>'","'>='","'=='","'&&'","'!'","'||'","fun","%eof"]
        bit_start = st Prelude.* 42
        bit_end = (st Prelude.+ 1) Prelude.* 42
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..41]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (5) = happyGoto action_14
action_0 (6) = happyGoto action_3
action_0 _ = happyReduce_4

action_1 (12) = happyShift action_5
action_1 (13) = happyShift action_6
action_1 (14) = happyShift action_7
action_1 (18) = happyShift action_8
action_1 (21) = happyShift action_9
action_1 (29) = happyShift action_10
action_1 (31) = happyShift action_11
action_1 (32) = happyShift action_12
action_1 (39) = happyShift action_13
action_1 (10) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (6) = happyGoto action_3
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (12) = happyShift action_5
action_3 (13) = happyShift action_6
action_3 (14) = happyShift action_7
action_3 (18) = happyShift action_8
action_3 (21) = happyShift action_9
action_3 (29) = happyShift action_10
action_3 (31) = happyShift action_11
action_3 (32) = happyShift action_12
action_3 (39) = happyShift action_13
action_3 (41) = happyShift action_34
action_3 (7) = happyGoto action_32
action_3 (10) = happyGoto action_33
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (17) = happyShift action_21
action_4 (18) = happyShift action_22
action_4 (19) = happyShift action_23
action_4 (20) = happyShift action_24
action_4 (33) = happyShift action_25
action_4 (34) = happyShift action_26
action_4 (35) = happyShift action_27
action_4 (36) = happyShift action_28
action_4 (37) = happyShift action_29
action_4 (38) = happyShift action_30
action_4 (40) = happyShift action_31
action_4 (42) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (13) = happyShift action_20
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (21) = happyShift action_19
action_6 _ = happyReduce_30

action_7 _ = happyReduce_26

action_8 (12) = happyShift action_5
action_8 (13) = happyShift action_6
action_8 (14) = happyShift action_7
action_8 (18) = happyShift action_8
action_8 (21) = happyShift action_9
action_8 (29) = happyShift action_10
action_8 (31) = happyShift action_11
action_8 (32) = happyShift action_12
action_8 (39) = happyShift action_13
action_8 (10) = happyGoto action_18
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (12) = happyShift action_5
action_9 (13) = happyShift action_6
action_9 (14) = happyShift action_7
action_9 (18) = happyShift action_8
action_9 (21) = happyShift action_9
action_9 (29) = happyShift action_10
action_9 (31) = happyShift action_11
action_9 (32) = happyShift action_12
action_9 (39) = happyShift action_13
action_9 (10) = happyGoto action_17
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (21) = happyShift action_16
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_27

action_12 _ = happyReduce_28

action_13 (12) = happyShift action_5
action_13 (13) = happyShift action_6
action_13 (14) = happyShift action_7
action_13 (18) = happyShift action_8
action_13 (21) = happyShift action_9
action_13 (29) = happyShift action_10
action_13 (31) = happyShift action_11
action_13 (32) = happyShift action_12
action_13 (39) = happyShift action_13
action_13 (10) = happyGoto action_15
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (42) = happyAccept
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_25

action_16 (12) = happyShift action_5
action_16 (13) = happyShift action_6
action_16 (14) = happyShift action_7
action_16 (18) = happyShift action_8
action_16 (21) = happyShift action_9
action_16 (29) = happyShift action_10
action_16 (31) = happyShift action_11
action_16 (32) = happyShift action_12
action_16 (39) = happyShift action_13
action_16 (10) = happyGoto action_51
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (17) = happyShift action_21
action_17 (18) = happyShift action_22
action_17 (19) = happyShift action_23
action_17 (20) = happyShift action_24
action_17 (22) = happyShift action_50
action_17 (33) = happyShift action_25
action_17 (34) = happyShift action_26
action_17 (35) = happyShift action_27
action_17 (36) = happyShift action_28
action_17 (37) = happyShift action_29
action_17 (38) = happyShift action_30
action_17 (40) = happyShift action_31
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_24

action_19 (12) = happyShift action_5
action_19 (13) = happyShift action_6
action_19 (14) = happyShift action_7
action_19 (18) = happyShift action_8
action_19 (21) = happyShift action_9
action_19 (29) = happyShift action_10
action_19 (31) = happyShift action_11
action_19 (32) = happyShift action_12
action_19 (39) = happyShift action_13
action_19 (10) = happyGoto action_48
action_19 (11) = happyGoto action_49
action_19 _ = happyReduce_34

action_20 (28) = happyShift action_47
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (12) = happyShift action_5
action_21 (13) = happyShift action_6
action_21 (14) = happyShift action_7
action_21 (18) = happyShift action_8
action_21 (21) = happyShift action_9
action_21 (29) = happyShift action_10
action_21 (31) = happyShift action_11
action_21 (32) = happyShift action_12
action_21 (39) = happyShift action_13
action_21 (10) = happyGoto action_46
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (12) = happyShift action_5
action_22 (13) = happyShift action_6
action_22 (14) = happyShift action_7
action_22 (18) = happyShift action_8
action_22 (21) = happyShift action_9
action_22 (29) = happyShift action_10
action_22 (31) = happyShift action_11
action_22 (32) = happyShift action_12
action_22 (39) = happyShift action_13
action_22 (10) = happyGoto action_45
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (12) = happyShift action_5
action_23 (13) = happyShift action_6
action_23 (14) = happyShift action_7
action_23 (18) = happyShift action_8
action_23 (21) = happyShift action_9
action_23 (29) = happyShift action_10
action_23 (31) = happyShift action_11
action_23 (32) = happyShift action_12
action_23 (39) = happyShift action_13
action_23 (10) = happyGoto action_44
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (12) = happyShift action_5
action_24 (13) = happyShift action_6
action_24 (14) = happyShift action_7
action_24 (18) = happyShift action_8
action_24 (21) = happyShift action_9
action_24 (29) = happyShift action_10
action_24 (31) = happyShift action_11
action_24 (32) = happyShift action_12
action_24 (39) = happyShift action_13
action_24 (10) = happyGoto action_43
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (12) = happyShift action_5
action_25 (13) = happyShift action_6
action_25 (14) = happyShift action_7
action_25 (18) = happyShift action_8
action_25 (21) = happyShift action_9
action_25 (29) = happyShift action_10
action_25 (31) = happyShift action_11
action_25 (32) = happyShift action_12
action_25 (39) = happyShift action_13
action_25 (10) = happyGoto action_42
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (12) = happyShift action_5
action_26 (13) = happyShift action_6
action_26 (14) = happyShift action_7
action_26 (18) = happyShift action_8
action_26 (21) = happyShift action_9
action_26 (29) = happyShift action_10
action_26 (31) = happyShift action_11
action_26 (32) = happyShift action_12
action_26 (39) = happyShift action_13
action_26 (10) = happyGoto action_41
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (12) = happyShift action_5
action_27 (13) = happyShift action_6
action_27 (14) = happyShift action_7
action_27 (18) = happyShift action_8
action_27 (21) = happyShift action_9
action_27 (29) = happyShift action_10
action_27 (31) = happyShift action_11
action_27 (32) = happyShift action_12
action_27 (39) = happyShift action_13
action_27 (10) = happyGoto action_40
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (12) = happyShift action_5
action_28 (13) = happyShift action_6
action_28 (14) = happyShift action_7
action_28 (18) = happyShift action_8
action_28 (21) = happyShift action_9
action_28 (29) = happyShift action_10
action_28 (31) = happyShift action_11
action_28 (32) = happyShift action_12
action_28 (39) = happyShift action_13
action_28 (10) = happyGoto action_39
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (12) = happyShift action_5
action_29 (13) = happyShift action_6
action_29 (14) = happyShift action_7
action_29 (18) = happyShift action_8
action_29 (21) = happyShift action_9
action_29 (29) = happyShift action_10
action_29 (31) = happyShift action_11
action_29 (32) = happyShift action_12
action_29 (39) = happyShift action_13
action_29 (10) = happyGoto action_38
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (12) = happyShift action_5
action_30 (13) = happyShift action_6
action_30 (14) = happyShift action_7
action_30 (18) = happyShift action_8
action_30 (21) = happyShift action_9
action_30 (29) = happyShift action_10
action_30 (31) = happyShift action_11
action_30 (32) = happyShift action_12
action_30 (39) = happyShift action_13
action_30 (10) = happyGoto action_37
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (12) = happyShift action_5
action_31 (13) = happyShift action_6
action_31 (14) = happyShift action_7
action_31 (18) = happyShift action_8
action_31 (21) = happyShift action_9
action_31 (29) = happyShift action_10
action_31 (31) = happyShift action_11
action_31 (32) = happyShift action_12
action_31 (39) = happyShift action_13
action_31 (10) = happyGoto action_36
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_3

action_33 (17) = happyShift action_21
action_33 (18) = happyShift action_22
action_33 (19) = happyShift action_23
action_33 (20) = happyShift action_24
action_33 (33) = happyShift action_25
action_33 (34) = happyShift action_26
action_33 (35) = happyShift action_27
action_33 (36) = happyShift action_28
action_33 (37) = happyShift action_29
action_33 (38) = happyShift action_30
action_33 (40) = happyShift action_31
action_33 _ = happyReduce_2

action_34 (13) = happyShift action_35
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (21) = happyShift action_56
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (17) = happyShift action_21
action_36 (18) = happyShift action_22
action_36 (19) = happyShift action_23
action_36 (20) = happyShift action_24
action_36 (33) = happyShift action_25
action_36 (34) = happyShift action_26
action_36 (35) = happyShift action_27
action_36 (36) = happyShift action_28
action_36 (37) = happyShift action_29
action_36 (38) = happyShift action_30
action_36 _ = happyReduce_13

action_37 (17) = happyShift action_21
action_37 (18) = happyShift action_22
action_37 (19) = happyShift action_23
action_37 (20) = happyShift action_24
action_37 (33) = happyShift action_25
action_37 (34) = happyShift action_26
action_37 (35) = happyShift action_27
action_37 (36) = happyShift action_28
action_37 (37) = happyShift action_29
action_37 _ = happyReduce_14

action_38 (17) = happyShift action_21
action_38 (18) = happyShift action_22
action_38 (19) = happyShift action_23
action_38 (20) = happyShift action_24
action_38 (33) = happyShift action_25
action_38 (34) = happyShift action_26
action_38 (35) = happyShift action_27
action_38 (36) = happyShift action_28
action_38 (37) = happyFail []
action_38 _ = happyReduce_15

action_39 (17) = happyShift action_21
action_39 (18) = happyShift action_22
action_39 (19) = happyShift action_23
action_39 (20) = happyShift action_24
action_39 (33) = happyFail []
action_39 (34) = happyFail []
action_39 (35) = happyFail []
action_39 (36) = happyFail []
action_39 _ = happyReduce_19

action_40 (17) = happyShift action_21
action_40 (18) = happyShift action_22
action_40 (19) = happyShift action_23
action_40 (20) = happyShift action_24
action_40 (33) = happyFail []
action_40 (34) = happyFail []
action_40 (35) = happyFail []
action_40 (36) = happyFail []
action_40 _ = happyReduce_17

action_41 (17) = happyShift action_21
action_41 (18) = happyShift action_22
action_41 (19) = happyShift action_23
action_41 (20) = happyShift action_24
action_41 (33) = happyFail []
action_41 (34) = happyFail []
action_41 (35) = happyFail []
action_41 (36) = happyFail []
action_41 _ = happyReduce_18

action_42 (17) = happyShift action_21
action_42 (18) = happyShift action_22
action_42 (19) = happyShift action_23
action_42 (20) = happyShift action_24
action_42 (33) = happyFail []
action_42 (34) = happyFail []
action_42 (35) = happyFail []
action_42 (36) = happyFail []
action_42 _ = happyReduce_16

action_43 _ = happyReduce_23

action_44 _ = happyReduce_22

action_45 (19) = happyShift action_23
action_45 (20) = happyShift action_24
action_45 _ = happyReduce_21

action_46 (19) = happyShift action_23
action_46 (20) = happyShift action_24
action_46 _ = happyReduce_20

action_47 (12) = happyShift action_5
action_47 (13) = happyShift action_6
action_47 (14) = happyShift action_7
action_47 (18) = happyShift action_8
action_47 (21) = happyShift action_9
action_47 (29) = happyShift action_10
action_47 (31) = happyShift action_11
action_47 (32) = happyShift action_12
action_47 (39) = happyShift action_13
action_47 (10) = happyGoto action_55
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (17) = happyShift action_21
action_48 (18) = happyShift action_22
action_48 (19) = happyShift action_23
action_48 (20) = happyShift action_24
action_48 (33) = happyShift action_25
action_48 (34) = happyShift action_26
action_48 (35) = happyShift action_27
action_48 (36) = happyShift action_28
action_48 (37) = happyShift action_29
action_48 (38) = happyShift action_30
action_48 (40) = happyShift action_31
action_48 _ = happyReduce_33

action_49 (22) = happyShift action_53
action_49 (27) = happyShift action_54
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_31

action_51 (17) = happyShift action_21
action_51 (18) = happyShift action_22
action_51 (19) = happyShift action_23
action_51 (20) = happyShift action_24
action_51 (22) = happyShift action_52
action_51 (33) = happyShift action_25
action_51 (34) = happyShift action_26
action_51 (35) = happyShift action_27
action_51 (36) = happyShift action_28
action_51 (37) = happyShift action_29
action_51 (38) = happyShift action_30
action_51 (40) = happyShift action_31
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (12) = happyShift action_5
action_52 (13) = happyShift action_6
action_52 (14) = happyShift action_7
action_52 (18) = happyShift action_8
action_52 (21) = happyShift action_9
action_52 (29) = happyShift action_10
action_52 (31) = happyShift action_11
action_52 (32) = happyShift action_12
action_52 (39) = happyShift action_13
action_52 (10) = happyGoto action_61
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_29

action_54 (12) = happyShift action_5
action_54 (13) = happyShift action_6
action_54 (14) = happyShift action_7
action_54 (18) = happyShift action_8
action_54 (21) = happyShift action_9
action_54 (29) = happyShift action_10
action_54 (31) = happyShift action_11
action_54 (32) = happyShift action_12
action_54 (39) = happyShift action_13
action_54 (10) = happyGoto action_60
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (17) = happyShift action_21
action_55 (18) = happyShift action_22
action_55 (19) = happyShift action_23
action_55 (20) = happyShift action_24
action_55 (25) = happyShift action_59
action_55 (33) = happyShift action_25
action_55 (34) = happyShift action_26
action_55 (35) = happyShift action_27
action_55 (36) = happyShift action_28
action_55 (37) = happyShift action_29
action_55 (38) = happyShift action_30
action_55 (40) = happyShift action_31
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (13) = happyShift action_58
action_56 (8) = happyGoto action_57
action_56 _ = happyReduce_8

action_57 (22) = happyShift action_65
action_57 (27) = happyShift action_66
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (26) = happyShift action_64
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (12) = happyShift action_5
action_59 (13) = happyShift action_6
action_59 (14) = happyShift action_7
action_59 (18) = happyShift action_8
action_59 (21) = happyShift action_9
action_59 (29) = happyShift action_10
action_59 (31) = happyShift action_11
action_59 (32) = happyShift action_12
action_59 (39) = happyShift action_13
action_59 (10) = happyGoto action_63
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (17) = happyShift action_21
action_60 (18) = happyShift action_22
action_60 (19) = happyShift action_23
action_60 (20) = happyShift action_24
action_60 (33) = happyShift action_25
action_60 (34) = happyShift action_26
action_60 (35) = happyShift action_27
action_60 (36) = happyShift action_28
action_60 (37) = happyShift action_29
action_60 (38) = happyShift action_30
action_60 (40) = happyShift action_31
action_60 _ = happyReduce_32

action_61 (17) = happyShift action_21
action_61 (18) = happyShift action_22
action_61 (19) = happyShift action_23
action_61 (20) = happyShift action_24
action_61 (25) = happyShift action_62
action_61 (33) = happyShift action_25
action_61 (34) = happyShift action_26
action_61 (35) = happyShift action_27
action_61 (36) = happyShift action_28
action_61 (37) = happyShift action_29
action_61 (38) = happyShift action_30
action_61 (40) = happyShift action_31
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (30) = happyShift action_72
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (17) = happyShift action_21
action_63 (18) = happyShift action_22
action_63 (19) = happyShift action_23
action_63 (20) = happyShift action_24
action_63 (33) = happyShift action_25
action_63 (34) = happyShift action_26
action_63 (35) = happyShift action_27
action_63 (36) = happyShift action_28
action_63 (37) = happyShift action_29
action_63 (38) = happyShift action_30
action_63 (40) = happyShift action_31
action_63 _ = happyReduce_11

action_64 (15) = happyShift action_70
action_64 (16) = happyShift action_71
action_64 (9) = happyGoto action_69
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (24) = happyShift action_68
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (13) = happyShift action_67
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (26) = happyShift action_75
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (12) = happyShift action_5
action_68 (13) = happyShift action_6
action_68 (14) = happyShift action_7
action_68 (18) = happyShift action_8
action_68 (21) = happyShift action_9
action_68 (29) = happyShift action_10
action_68 (31) = happyShift action_11
action_68 (32) = happyShift action_12
action_68 (39) = happyShift action_13
action_68 (10) = happyGoto action_74
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_7

action_70 _ = happyReduce_9

action_71 _ = happyReduce_10

action_72 (12) = happyShift action_5
action_72 (13) = happyShift action_6
action_72 (14) = happyShift action_7
action_72 (18) = happyShift action_8
action_72 (21) = happyShift action_9
action_72 (29) = happyShift action_10
action_72 (31) = happyShift action_11
action_72 (32) = happyShift action_12
action_72 (39) = happyShift action_13
action_72 (10) = happyGoto action_73
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (17) = happyShift action_21
action_73 (18) = happyShift action_22
action_73 (19) = happyShift action_23
action_73 (20) = happyShift action_24
action_73 (33) = happyShift action_25
action_73 (34) = happyShift action_26
action_73 (35) = happyShift action_27
action_73 (36) = happyShift action_28
action_73 (37) = happyShift action_29
action_73 (38) = happyShift action_30
action_73 (40) = happyShift action_31
action_73 _ = happyReduce_12

action_74 (17) = happyShift action_21
action_74 (18) = happyShift action_22
action_74 (19) = happyShift action_23
action_74 (20) = happyShift action_24
action_74 (23) = happyShift action_77
action_74 (33) = happyShift action_25
action_74 (34) = happyShift action_26
action_74 (35) = happyShift action_27
action_74 (36) = happyShift action_28
action_74 (37) = happyShift action_29
action_74 (38) = happyShift action_30
action_74 (40) = happyShift action_31
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (15) = happyShift action_70
action_75 (16) = happyShift action_71
action_75 (9) = happyGoto action_76
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_6

action_77 _ = happyReduce_5

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Program happy_var_1 happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  6 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 ++ [happy_var_2]
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_0  6 happyReduction_4
happyReduction_4  =  HappyAbsSyn6
		 ([]
	)

happyReduce_5 = happyReduce 8 7 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenSym happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 ((happy_var_2, Function happy_var_4 happy_var_7)
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 5 8 happyReduction_6
happyReduction_6 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenSym happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (happy_var_1 ++ [(happy_var_3, happy_var_5)]
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_3  8 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TokenSym happy_var_1))
	 =  HappyAbsSyn8
		 ([(happy_var_1, happy_var_3)]
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_0  8 happyReduction_8
happyReduction_8  =  HappyAbsSyn8
		 ([]
	)

happyReduce_9 = happySpecReduce_1  9 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn9
		 (TInt
	)

happyReduce_10 = happySpecReduce_1  9 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn9
		 (TBool
	)

happyReduce_11 = happyReduce 6 10 happyReduction_11
happyReduction_11 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenSym happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Decl happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 8 10 happyReduction_12
happyReduction_12 ((HappyAbsSyn10  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (If happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_3  10 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin Or happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  10 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin And happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin EQ happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  10 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin LT happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  10 happyReduction_17
happyReduction_17 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin GT happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin LE happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  10 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin GE happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  10 happyReduction_20
happyReduction_20 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin Add happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  10 happyReduction_21
happyReduction_21 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin Sub happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  10 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin Mult happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (Bin Div happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  10 happyReduction_24
happyReduction_24 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Unary Neg happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_2  10 happyReduction_25
happyReduction_25 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Unary Not happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  10 happyReduction_26
happyReduction_26 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn10
		 (Lit (IntV happy_var_1)
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  10 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn10
		 (Lit (BoolV True)
	)

happyReduce_28 = happySpecReduce_1  10 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn10
		 (Lit (BoolV False)
	)

happyReduce_29 = happyReduce 4 10 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenSym happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Call happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_1  10 happyReduction_30
happyReduction_30 (HappyTerminal (TokenSym happy_var_1))
	 =  HappyAbsSyn10
		 (Var happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  10 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  11 happyReduction_32
happyReduction_32 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  11 happyReduction_33
happyReduction_33 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_0  11 happyReduction_34
happyReduction_34  =  HappyAbsSyn11
		 ([]
	)

happyNewToken action sts stk [] =
	action 42 42 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenVar -> cont 12;
	TokenSym happy_dollar_dollar -> cont 13;
	TokenInt happy_dollar_dollar -> cont 14;
	TokenTInt -> cont 15;
	TokenTBool -> cont 16;
	TokenPlus -> cont 17;
	TokenMinus -> cont 18;
	TokenTimes -> cont 19;
	TokenDiv -> cont 20;
	TokenLParen -> cont 21;
	TokenRParen -> cont 22;
	TokenRB -> cont 23;
	TokenLB -> cont 24;
	TokenSemiColon -> cont 25;
	TokenColon -> cont 26;
	TokenComma -> cont 27;
	TokenEq -> cont 28;
	TokenIf -> cont 29;
	TokenElse -> cont 30;
	TokenTrue -> cont 31;
	TokenFalse -> cont 32;
	TokenLT -> cont 33;
	TokenLE -> cont 34;
	TokenGT -> cont 35;
	TokenGE -> cont 36;
	TokenComp -> cont 37;
	TokenAnd -> cont 38;
	TokenNot -> cont 39;
	TokenOr -> cont 40;
	TokenFunc -> cont 41;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 42 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parser1 tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn5 z -> happyReturn z; _other -> notHappyAtAll })

parser2 tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn10 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

parseProg = parser1 . scanTokens

parseExpr = parser2 . scanTokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
