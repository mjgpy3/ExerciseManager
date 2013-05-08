module Test_DataParser where

import DataParser
import Test.HUnit
import ExerciseManager

test_parseStandardDate_returns_a_date_object_that_makes_sense =
  TestCase (assertEqual "Making sure that parseStandardDate works" (Date 4 6 1992) (parseStandardDate "04/06/1992"))

tests = TestList [test_parseStandardDate_returns_a_date_object_that_makes_sense]

main = runTestTT tests
