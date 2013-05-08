module Test_DataParser where

import DataParser
import Test.HUnit
import ExerciseManager

test_parseDate_returns_a_date_object_that_makes_sense =
  TestCase (assertEqual "Making sure that parseDate works" (Date 4 6 1992) (parseDate "04/06/1992"))

test_parseTime_returns_a_time_object_that_makes_sense =
  TestCase (assertEqual "Making sure that parseTime works" (Time 5 30 0 "PM") (parseTime "05:30:00 PM"))

tests = TestList [test_parseDate_returns_a_date_object_that_makes_sense,
                  test_parseTime_returns_a_time_object_that_makes_sense]

main = runTestTT tests
