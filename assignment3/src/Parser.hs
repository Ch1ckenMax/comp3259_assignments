{-# OPTIONS_GHC -w #-}
module Parser (parseExpr) where
import Data.Char (isDigit, isSpace, isAlpha)
import Prelude hiding (LT, GT, EQ)
import Declare
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,259) ([36224,13316,80,0,32768,0,16,0,7680,32256,1,64,0,128,0,0,1,0,0,0,0,0,0,6912,26633,160,4662,16592,1,32,0,0,0,0,0,0,9056,3329,20,0,0,36224,13316,80,6016,24448,0,0,0,16,2,0,2048,0,0,16,24576,291,5133,18112,6658,32808,1165,20532,6912,26633,160,4662,16592,27649,40996,641,18648,832,45061,32913,2566,9056,3329,49172,582,10266,36224,13316,80,2331,41064,4096,0,0,0,4,0,60,252,30720,63488,0,240,240,57344,1,0,960,0,32768,7,0,3840,0,0,0,0,0,0,0,96,0,49152,0,0,1504,6112,12288,0,0,96,0,4096,0,0,9324,33184,2,0,0,30720,63489,24581,291,5133,57344,57345,23,32768,0,0,1024,256,0,0,0,0,0,0,32,8,0,0,3072,0,0,1024,16384,36224,13316,80,96,0,13824,53266,320,384,0,0,1084,764,0,256,0,32768,8192,57344,57345,23,0,32768,32768,32903,95,32768,0,27648,40996,641,18648,832,45061,32913,2566,9056,3329,20,480,6112,49152,49155,47,1920,24448,0,79,191,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Exp","Vars","App","typ","var","vars","and","id","int","Int","Bool","'+'","'-'","'*'","'/'","'('","')'","'}'","'{'","';'","':'","','","'='","if","else","true","false","'<'","'<='","'>'","'>='","'=='","'&&'","'!'","'||'","fun","'->'","%eof"]
        bit_start = st Prelude.* 41
        bit_end = (st Prelude.+ 1) Prelude.* 41
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..40]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (8) = happyShift action_5
action_0 (9) = happyShift action_6
action_0 (11) = happyShift action_7
action_0 (12) = happyShift action_8
action_0 (16) = happyShift action_9
action_0 (19) = happyShift action_10
action_0 (27) = happyShift action_11
action_0 (29) = happyShift action_12
action_0 (30) = happyShift action_13
action_0 (37) = happyShift action_14
action_0 (39) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 (6) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (39) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (19) = happyShift action_34
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (15) = happyShift action_23
action_3 (16) = happyShift action_24
action_3 (17) = happyShift action_25
action_3 (18) = happyShift action_26
action_3 (31) = happyShift action_27
action_3 (32) = happyShift action_28
action_3 (33) = happyShift action_29
action_3 (34) = happyShift action_30
action_3 (35) = happyShift action_31
action_3 (36) = happyShift action_32
action_3 (38) = happyShift action_33
action_3 (41) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (19) = happyShift action_22
action_4 _ = happyReduce_18

action_5 (11) = happyShift action_21
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (11) = happyShift action_20
action_6 (5) = happyGoto action_19
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_22

action_8 _ = happyReduce_24

action_9 (8) = happyShift action_5
action_9 (9) = happyShift action_6
action_9 (11) = happyShift action_7
action_9 (12) = happyShift action_8
action_9 (16) = happyShift action_9
action_9 (19) = happyShift action_10
action_9 (27) = happyShift action_11
action_9 (29) = happyShift action_12
action_9 (30) = happyShift action_13
action_9 (37) = happyShift action_14
action_9 (39) = happyShift action_2
action_9 (4) = happyGoto action_18
action_9 (6) = happyGoto action_4
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (8) = happyShift action_5
action_10 (9) = happyShift action_6
action_10 (11) = happyShift action_7
action_10 (12) = happyShift action_8
action_10 (16) = happyShift action_9
action_10 (19) = happyShift action_10
action_10 (27) = happyShift action_11
action_10 (29) = happyShift action_12
action_10 (30) = happyShift action_13
action_10 (37) = happyShift action_14
action_10 (39) = happyShift action_2
action_10 (4) = happyGoto action_17
action_10 (6) = happyGoto action_4
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (19) = happyShift action_16
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_25

action_13 _ = happyReduce_26

action_14 (8) = happyShift action_5
action_14 (9) = happyShift action_6
action_14 (11) = happyShift action_7
action_14 (12) = happyShift action_8
action_14 (16) = happyShift action_9
action_14 (19) = happyShift action_10
action_14 (27) = happyShift action_11
action_14 (29) = happyShift action_12
action_14 (30) = happyShift action_13
action_14 (37) = happyShift action_14
action_14 (39) = happyShift action_2
action_14 (4) = happyGoto action_15
action_14 (6) = happyGoto action_4
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_17

action_16 (8) = happyShift action_5
action_16 (9) = happyShift action_6
action_16 (11) = happyShift action_7
action_16 (12) = happyShift action_8
action_16 (16) = happyShift action_9
action_16 (19) = happyShift action_10
action_16 (27) = happyShift action_11
action_16 (29) = happyShift action_12
action_16 (30) = happyShift action_13
action_16 (37) = happyShift action_14
action_16 (39) = happyShift action_2
action_16 (4) = happyGoto action_53
action_16 (6) = happyGoto action_4
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (15) = happyShift action_23
action_17 (16) = happyShift action_24
action_17 (17) = happyShift action_25
action_17 (18) = happyShift action_26
action_17 (20) = happyShift action_52
action_17 (31) = happyShift action_27
action_17 (32) = happyShift action_28
action_17 (33) = happyShift action_29
action_17 (34) = happyShift action_30
action_17 (35) = happyShift action_31
action_17 (36) = happyShift action_32
action_17 (38) = happyShift action_33
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_16

action_19 (10) = happyShift action_50
action_19 (23) = happyShift action_51
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (24) = happyShift action_49
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (24) = happyShift action_48
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (8) = happyShift action_5
action_22 (9) = happyShift action_6
action_22 (11) = happyShift action_7
action_22 (12) = happyShift action_8
action_22 (16) = happyShift action_9
action_22 (19) = happyShift action_10
action_22 (27) = happyShift action_11
action_22 (29) = happyShift action_12
action_22 (30) = happyShift action_13
action_22 (37) = happyShift action_14
action_22 (39) = happyShift action_2
action_22 (4) = happyGoto action_47
action_22 (6) = happyGoto action_4
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (8) = happyShift action_5
action_23 (9) = happyShift action_6
action_23 (11) = happyShift action_7
action_23 (12) = happyShift action_8
action_23 (16) = happyShift action_9
action_23 (19) = happyShift action_10
action_23 (27) = happyShift action_11
action_23 (29) = happyShift action_12
action_23 (30) = happyShift action_13
action_23 (37) = happyShift action_14
action_23 (39) = happyShift action_2
action_23 (4) = happyGoto action_46
action_23 (6) = happyGoto action_4
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (8) = happyShift action_5
action_24 (9) = happyShift action_6
action_24 (11) = happyShift action_7
action_24 (12) = happyShift action_8
action_24 (16) = happyShift action_9
action_24 (19) = happyShift action_10
action_24 (27) = happyShift action_11
action_24 (29) = happyShift action_12
action_24 (30) = happyShift action_13
action_24 (37) = happyShift action_14
action_24 (39) = happyShift action_2
action_24 (4) = happyGoto action_45
action_24 (6) = happyGoto action_4
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (8) = happyShift action_5
action_25 (9) = happyShift action_6
action_25 (11) = happyShift action_7
action_25 (12) = happyShift action_8
action_25 (16) = happyShift action_9
action_25 (19) = happyShift action_10
action_25 (27) = happyShift action_11
action_25 (29) = happyShift action_12
action_25 (30) = happyShift action_13
action_25 (37) = happyShift action_14
action_25 (39) = happyShift action_2
action_25 (4) = happyGoto action_44
action_25 (6) = happyGoto action_4
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (8) = happyShift action_5
action_26 (9) = happyShift action_6
action_26 (11) = happyShift action_7
action_26 (12) = happyShift action_8
action_26 (16) = happyShift action_9
action_26 (19) = happyShift action_10
action_26 (27) = happyShift action_11
action_26 (29) = happyShift action_12
action_26 (30) = happyShift action_13
action_26 (37) = happyShift action_14
action_26 (39) = happyShift action_2
action_26 (4) = happyGoto action_43
action_26 (6) = happyGoto action_4
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (8) = happyShift action_5
action_27 (9) = happyShift action_6
action_27 (11) = happyShift action_7
action_27 (12) = happyShift action_8
action_27 (16) = happyShift action_9
action_27 (19) = happyShift action_10
action_27 (27) = happyShift action_11
action_27 (29) = happyShift action_12
action_27 (30) = happyShift action_13
action_27 (37) = happyShift action_14
action_27 (39) = happyShift action_2
action_27 (4) = happyGoto action_42
action_27 (6) = happyGoto action_4
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (8) = happyShift action_5
action_28 (9) = happyShift action_6
action_28 (11) = happyShift action_7
action_28 (12) = happyShift action_8
action_28 (16) = happyShift action_9
action_28 (19) = happyShift action_10
action_28 (27) = happyShift action_11
action_28 (29) = happyShift action_12
action_28 (30) = happyShift action_13
action_28 (37) = happyShift action_14
action_28 (39) = happyShift action_2
action_28 (4) = happyGoto action_41
action_28 (6) = happyGoto action_4
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (8) = happyShift action_5
action_29 (9) = happyShift action_6
action_29 (11) = happyShift action_7
action_29 (12) = happyShift action_8
action_29 (16) = happyShift action_9
action_29 (19) = happyShift action_10
action_29 (27) = happyShift action_11
action_29 (29) = happyShift action_12
action_29 (30) = happyShift action_13
action_29 (37) = happyShift action_14
action_29 (39) = happyShift action_2
action_29 (4) = happyGoto action_40
action_29 (6) = happyGoto action_4
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (8) = happyShift action_5
action_30 (9) = happyShift action_6
action_30 (11) = happyShift action_7
action_30 (12) = happyShift action_8
action_30 (16) = happyShift action_9
action_30 (19) = happyShift action_10
action_30 (27) = happyShift action_11
action_30 (29) = happyShift action_12
action_30 (30) = happyShift action_13
action_30 (37) = happyShift action_14
action_30 (39) = happyShift action_2
action_30 (4) = happyGoto action_39
action_30 (6) = happyGoto action_4
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (8) = happyShift action_5
action_31 (9) = happyShift action_6
action_31 (11) = happyShift action_7
action_31 (12) = happyShift action_8
action_31 (16) = happyShift action_9
action_31 (19) = happyShift action_10
action_31 (27) = happyShift action_11
action_31 (29) = happyShift action_12
action_31 (30) = happyShift action_13
action_31 (37) = happyShift action_14
action_31 (39) = happyShift action_2
action_31 (4) = happyGoto action_38
action_31 (6) = happyGoto action_4
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (8) = happyShift action_5
action_32 (9) = happyShift action_6
action_32 (11) = happyShift action_7
action_32 (12) = happyShift action_8
action_32 (16) = happyShift action_9
action_32 (19) = happyShift action_10
action_32 (27) = happyShift action_11
action_32 (29) = happyShift action_12
action_32 (30) = happyShift action_13
action_32 (37) = happyShift action_14
action_32 (39) = happyShift action_2
action_32 (4) = happyGoto action_37
action_32 (6) = happyGoto action_4
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (8) = happyShift action_5
action_33 (9) = happyShift action_6
action_33 (11) = happyShift action_7
action_33 (12) = happyShift action_8
action_33 (16) = happyShift action_9
action_33 (19) = happyShift action_10
action_33 (27) = happyShift action_11
action_33 (29) = happyShift action_12
action_33 (30) = happyShift action_13
action_33 (37) = happyShift action_14
action_33 (39) = happyShift action_2
action_33 (4) = happyGoto action_36
action_33 (6) = happyGoto action_4
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (11) = happyShift action_35
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (24) = happyShift action_62
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (15) = happyShift action_23
action_36 (16) = happyShift action_24
action_36 (17) = happyShift action_25
action_36 (18) = happyShift action_26
action_36 (31) = happyShift action_27
action_36 (32) = happyShift action_28
action_36 (33) = happyShift action_29
action_36 (34) = happyShift action_30
action_36 (35) = happyShift action_31
action_36 (36) = happyShift action_32
action_36 _ = happyReduce_5

action_37 (15) = happyShift action_23
action_37 (16) = happyShift action_24
action_37 (17) = happyShift action_25
action_37 (18) = happyShift action_26
action_37 (31) = happyShift action_27
action_37 (32) = happyShift action_28
action_37 (33) = happyShift action_29
action_37 (34) = happyShift action_30
action_37 (35) = happyShift action_31
action_37 _ = happyReduce_6

action_38 (15) = happyShift action_23
action_38 (16) = happyShift action_24
action_38 (17) = happyShift action_25
action_38 (18) = happyShift action_26
action_38 (31) = happyShift action_27
action_38 (32) = happyShift action_28
action_38 (33) = happyShift action_29
action_38 (34) = happyShift action_30
action_38 (35) = happyFail []
action_38 _ = happyReduce_7

action_39 (15) = happyShift action_23
action_39 (16) = happyShift action_24
action_39 (17) = happyShift action_25
action_39 (18) = happyShift action_26
action_39 (31) = happyFail []
action_39 (32) = happyFail []
action_39 (33) = happyFail []
action_39 (34) = happyFail []
action_39 _ = happyReduce_11

action_40 (15) = happyShift action_23
action_40 (16) = happyShift action_24
action_40 (17) = happyShift action_25
action_40 (18) = happyShift action_26
action_40 (31) = happyFail []
action_40 (32) = happyFail []
action_40 (33) = happyFail []
action_40 (34) = happyFail []
action_40 _ = happyReduce_9

action_41 (15) = happyShift action_23
action_41 (16) = happyShift action_24
action_41 (17) = happyShift action_25
action_41 (18) = happyShift action_26
action_41 (31) = happyFail []
action_41 (32) = happyFail []
action_41 (33) = happyFail []
action_41 (34) = happyFail []
action_41 _ = happyReduce_10

action_42 (15) = happyShift action_23
action_42 (16) = happyShift action_24
action_42 (17) = happyShift action_25
action_42 (18) = happyShift action_26
action_42 (31) = happyFail []
action_42 (32) = happyFail []
action_42 (33) = happyFail []
action_42 (34) = happyFail []
action_42 _ = happyReduce_8

action_43 _ = happyReduce_15

action_44 _ = happyReduce_14

action_45 (17) = happyShift action_25
action_45 (18) = happyShift action_26
action_45 _ = happyReduce_13

action_46 (17) = happyShift action_25
action_46 (18) = happyShift action_26
action_46 _ = happyReduce_12

action_47 (15) = happyShift action_23
action_47 (16) = happyShift action_24
action_47 (17) = happyShift action_25
action_47 (18) = happyShift action_26
action_47 (20) = happyShift action_61
action_47 (31) = happyShift action_27
action_47 (32) = happyShift action_28
action_47 (33) = happyShift action_29
action_47 (34) = happyShift action_30
action_47 (35) = happyShift action_31
action_47 (36) = happyShift action_32
action_47 (38) = happyShift action_33
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (13) = happyShift action_58
action_48 (14) = happyShift action_59
action_48 (7) = happyGoto action_60
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (13) = happyShift action_58
action_49 (14) = happyShift action_59
action_49 (7) = happyGoto action_57
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (11) = happyShift action_56
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (8) = happyShift action_5
action_51 (9) = happyShift action_6
action_51 (11) = happyShift action_7
action_51 (12) = happyShift action_8
action_51 (16) = happyShift action_9
action_51 (19) = happyShift action_10
action_51 (27) = happyShift action_11
action_51 (29) = happyShift action_12
action_51 (30) = happyShift action_13
action_51 (37) = happyShift action_14
action_51 (39) = happyShift action_2
action_51 (4) = happyGoto action_55
action_51 (6) = happyGoto action_4
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_23

action_53 (15) = happyShift action_23
action_53 (16) = happyShift action_24
action_53 (17) = happyShift action_25
action_53 (18) = happyShift action_26
action_53 (20) = happyShift action_54
action_53 (31) = happyShift action_27
action_53 (32) = happyShift action_28
action_53 (33) = happyShift action_29
action_53 (34) = happyShift action_30
action_53 (35) = happyShift action_31
action_53 (36) = happyShift action_32
action_53 (38) = happyShift action_33
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (8) = happyShift action_5
action_54 (9) = happyShift action_6
action_54 (11) = happyShift action_7
action_54 (12) = happyShift action_8
action_54 (16) = happyShift action_9
action_54 (19) = happyShift action_10
action_54 (27) = happyShift action_11
action_54 (29) = happyShift action_12
action_54 (30) = happyShift action_13
action_54 (37) = happyShift action_14
action_54 (39) = happyShift action_2
action_54 (4) = happyGoto action_68
action_54 (6) = happyGoto action_4
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (15) = happyShift action_23
action_55 (16) = happyShift action_24
action_55 (17) = happyShift action_25
action_55 (18) = happyShift action_26
action_55 (31) = happyShift action_27
action_55 (32) = happyShift action_28
action_55 (33) = happyShift action_29
action_55 (34) = happyShift action_30
action_55 (35) = happyShift action_31
action_55 (36) = happyShift action_32
action_55 (38) = happyShift action_33
action_55 _ = happyReduce_3

action_56 (24) = happyShift action_67
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (26) = happyShift action_66
action_57 (40) = happyShift action_65
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_27

action_59 _ = happyReduce_28

action_60 (26) = happyShift action_64
action_60 (40) = happyShift action_65
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_21

action_62 (13) = happyShift action_58
action_62 (14) = happyShift action_59
action_62 (7) = happyGoto action_63
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (20) = happyShift action_74
action_63 (40) = happyShift action_65
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (8) = happyShift action_5
action_64 (9) = happyShift action_6
action_64 (11) = happyShift action_7
action_64 (12) = happyShift action_8
action_64 (16) = happyShift action_9
action_64 (19) = happyShift action_10
action_64 (27) = happyShift action_11
action_64 (29) = happyShift action_12
action_64 (30) = happyShift action_13
action_64 (37) = happyShift action_14
action_64 (39) = happyShift action_2
action_64 (4) = happyGoto action_73
action_64 (6) = happyGoto action_4
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (13) = happyShift action_58
action_65 (14) = happyShift action_59
action_65 (7) = happyGoto action_72
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (8) = happyShift action_5
action_66 (9) = happyShift action_6
action_66 (11) = happyShift action_7
action_66 (12) = happyShift action_8
action_66 (16) = happyShift action_9
action_66 (19) = happyShift action_10
action_66 (27) = happyShift action_11
action_66 (29) = happyShift action_12
action_66 (30) = happyShift action_13
action_66 (37) = happyShift action_14
action_66 (39) = happyShift action_2
action_66 (4) = happyGoto action_71
action_66 (6) = happyGoto action_4
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (13) = happyShift action_58
action_67 (14) = happyShift action_59
action_67 (7) = happyGoto action_70
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (15) = happyShift action_23
action_68 (16) = happyShift action_24
action_68 (17) = happyShift action_25
action_68 (18) = happyShift action_26
action_68 (23) = happyShift action_69
action_68 (31) = happyShift action_27
action_68 (32) = happyShift action_28
action_68 (33) = happyShift action_29
action_68 (34) = happyShift action_30
action_68 (35) = happyShift action_31
action_68 (36) = happyShift action_32
action_68 (38) = happyShift action_33
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (28) = happyShift action_78
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (26) = happyShift action_77
action_70 (40) = happyShift action_65
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (15) = happyShift action_23
action_71 (16) = happyShift action_24
action_71 (17) = happyShift action_25
action_71 (18) = happyShift action_26
action_71 (31) = happyShift action_27
action_71 (32) = happyShift action_28
action_71 (33) = happyShift action_29
action_71 (34) = happyShift action_30
action_71 (35) = happyShift action_31
action_71 (36) = happyShift action_32
action_71 (38) = happyShift action_33
action_71 _ = happyReduce_19

action_72 (40) = happyShift action_65
action_72 _ = happyReduce_29

action_73 (15) = happyShift action_23
action_73 (16) = happyShift action_24
action_73 (17) = happyShift action_25
action_73 (18) = happyShift action_26
action_73 (23) = happyShift action_76
action_73 (31) = happyShift action_27
action_73 (32) = happyShift action_28
action_73 (33) = happyShift action_29
action_73 (34) = happyShift action_30
action_73 (35) = happyShift action_31
action_73 (36) = happyShift action_32
action_73 (38) = happyShift action_33
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (22) = happyShift action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (8) = happyShift action_5
action_75 (9) = happyShift action_6
action_75 (11) = happyShift action_7
action_75 (12) = happyShift action_8
action_75 (16) = happyShift action_9
action_75 (19) = happyShift action_10
action_75 (27) = happyShift action_11
action_75 (29) = happyShift action_12
action_75 (30) = happyShift action_13
action_75 (37) = happyShift action_14
action_75 (39) = happyShift action_2
action_75 (4) = happyGoto action_82
action_75 (6) = happyGoto action_4
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (8) = happyShift action_5
action_76 (9) = happyShift action_6
action_76 (11) = happyShift action_7
action_76 (12) = happyShift action_8
action_76 (16) = happyShift action_9
action_76 (19) = happyShift action_10
action_76 (27) = happyShift action_11
action_76 (29) = happyShift action_12
action_76 (30) = happyShift action_13
action_76 (37) = happyShift action_14
action_76 (39) = happyShift action_2
action_76 (4) = happyGoto action_81
action_76 (6) = happyGoto action_4
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (8) = happyShift action_5
action_77 (9) = happyShift action_6
action_77 (11) = happyShift action_7
action_77 (12) = happyShift action_8
action_77 (16) = happyShift action_9
action_77 (19) = happyShift action_10
action_77 (27) = happyShift action_11
action_77 (29) = happyShift action_12
action_77 (30) = happyShift action_13
action_77 (37) = happyShift action_14
action_77 (39) = happyShift action_2
action_77 (4) = happyGoto action_80
action_77 (6) = happyGoto action_4
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (8) = happyShift action_5
action_78 (9) = happyShift action_6
action_78 (11) = happyShift action_7
action_78 (12) = happyShift action_8
action_78 (16) = happyShift action_9
action_78 (19) = happyShift action_10
action_78 (27) = happyShift action_11
action_78 (29) = happyShift action_12
action_78 (30) = happyShift action_13
action_78 (37) = happyShift action_14
action_78 (39) = happyShift action_2
action_78 (4) = happyGoto action_79
action_78 (6) = happyGoto action_4
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (15) = happyShift action_23
action_79 (16) = happyShift action_24
action_79 (17) = happyShift action_25
action_79 (18) = happyShift action_26
action_79 (31) = happyShift action_27
action_79 (32) = happyShift action_28
action_79 (33) = happyShift action_29
action_79 (34) = happyShift action_30
action_79 (35) = happyShift action_31
action_79 (36) = happyShift action_32
action_79 (38) = happyShift action_33
action_79 _ = happyReduce_4

action_80 (15) = happyShift action_23
action_80 (16) = happyShift action_24
action_80 (17) = happyShift action_25
action_80 (18) = happyShift action_26
action_80 (31) = happyShift action_27
action_80 (32) = happyShift action_28
action_80 (33) = happyShift action_29
action_80 (34) = happyShift action_30
action_80 (35) = happyShift action_31
action_80 (36) = happyShift action_32
action_80 (38) = happyShift action_33
action_80 _ = happyReduce_20

action_81 (15) = happyShift action_23
action_81 (16) = happyShift action_24
action_81 (17) = happyShift action_25
action_81 (18) = happyShift action_26
action_81 (31) = happyShift action_27
action_81 (32) = happyShift action_28
action_81 (33) = happyShift action_29
action_81 (34) = happyShift action_30
action_81 (35) = happyShift action_31
action_81 (36) = happyShift action_32
action_81 (38) = happyShift action_33
action_81 _ = happyReduce_2

action_82 (15) = happyShift action_23
action_82 (16) = happyShift action_24
action_82 (17) = happyShift action_25
action_82 (18) = happyShift action_26
action_82 (21) = happyShift action_83
action_82 (31) = happyShift action_27
action_82 (32) = happyShift action_28
action_82 (33) = happyShift action_29
action_82 (34) = happyShift action_30
action_82 (35) = happyShift action_31
action_82 (36) = happyShift action_32
action_82 (38) = happyShift action_33
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_1

happyReduce_1 = happyReduce 9 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenSym happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Fun (happy_var_3, happy_var_5) happy_var_8
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 8 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenSym happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Decl happy_var_2 happy_var_4 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_3 = happyReduce 4 4 happyReduction_3
happyReduction_3 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (MultDecl happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 8 4 happyReduction_4
happyReduction_4 ((HappyAbsSyn4  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Or happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin And happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin EQ happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin LT happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin GT happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin LE happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin GE happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  4 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Add happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  4 happyReduction_13
happyReduction_13 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Sub happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Mult happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Bin Div happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Unary Neg happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Unary Not happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  4 happyReduction_18
happyReduction_18 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happyReduce 5 5 happyReduction_19
happyReduction_19 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenSym happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 ([(happy_var_1, happy_var_3, happy_var_5)]
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 7 5 happyReduction_20
happyReduction_20 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenSym happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 ((happy_var_3, happy_var_5, happy_var_7):happy_var_1
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 4 6 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Call happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_1  6 happyReduction_22
happyReduction_22 (HappyTerminal (TokenSym happy_var_1))
	 =  HappyAbsSyn6
		 (Var happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  6 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  6 happyReduction_24
happyReduction_24 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn6
		 (Lit (IntV happy_var_1)
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  6 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn6
		 (Lit (BoolV True)
	)

happyReduce_26 = happySpecReduce_1  6 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn6
		 (Lit (BoolV False)
	)

happyReduce_27 = happySpecReduce_1  7 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn7
		 (TInt
	)

happyReduce_28 = happySpecReduce_1  7 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn7
		 (TBool
	)

happyReduce_29 = happySpecReduce_3  7 happyReduction_29
happyReduction_29 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (TFun happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 41 41 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenVar -> cont 8;
	TokenVars -> cont 9;
	TokenAAnd -> cont 10;
	TokenSym happy_dollar_dollar -> cont 11;
	TokenInt happy_dollar_dollar -> cont 12;
	TokenTInt -> cont 13;
	TokenTBool -> cont 14;
	TokenPlus -> cont 15;
	TokenMinus -> cont 16;
	TokenTimes -> cont 17;
	TokenDiv -> cont 18;
	TokenLParen -> cont 19;
	TokenRParen -> cont 20;
	TokenRB -> cont 21;
	TokenLB -> cont 22;
	TokenSemiColon -> cont 23;
	TokenColon -> cont 24;
	TokenComma -> cont 25;
	TokenEq -> cont 26;
	TokenIf -> cont 27;
	TokenElse -> cont 28;
	TokenTrue -> cont 29;
	TokenFalse -> cont 30;
	TokenLT -> cont 31;
	TokenLE -> cont 32;
	TokenGT -> cont 33;
	TokenGE -> cont 34;
	TokenComp -> cont 35;
	TokenAnd -> cont 36;
	TokenNot -> cont 37;
	TokenOr -> cont 38;
	TokenFunc -> cont 39;
	TokenArrow -> cont 40;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 41 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Either String a -> (a -> Either String b) -> Either String b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> Either String a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Either String a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Either String a
happyError' = (\(tokens, _) -> parseError tokens)
parser tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError _ = Left "Parse error"

parseExpr = parser . scanTokens
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
