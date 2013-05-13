module Test_ExerciseData where

import Test.HUnit
import ExerciseData

test_totalReps_works_for_a_trivial_case =
  TestCase (assertEqual "Total reps should be reps/set times sets" 48 (totalReps (RepWorkout 12 4)))

test_addTimes_works_for_a_simple_case_where_there_is_no_overflow =
  TestCase (assertEqual "Times should add when there is no overflow" (Time 10 13 37 "PM") (addTimes (Time 7 10 12 "PM") (Time 3 3 25 "PM")))

test_toSeconds_works_for_the_zero_time =
  TestCase (assertEqual "A time of 0:0:0 AM has 0 seconds" 0 (toSeconds (Time 0 0 0 "AM")))

test_toSeconds_works_for_the_zero_pm_time =
  TestCase (assertEqual "A time of 0:0:0 PM has 43200 seconds" 43200 (toSeconds (Time 0 0 0 "PM")))

test_toSeconds_works_for_an_am_time =
  TestCase (assertEqual "Should be able to convert a time to seconds" 31032 ( toSeconds (Time 8 37 12 "AM")))

test_toSeconds_works_for_a_pm_time =
  TestCase (assertEqual "Should be able to convert a time to seconds" 48183 ( toSeconds (Time 1 23 3 "PM")))

test_timeFromSeconds_works_for_an_am_amount_of_seconds =
  TestCase (assertEqual "Should be able to convert seconds to a time (AM)" (Time 7 48 43 "AM") (timeFromSeconds 28123))

test_timeFromSeconds_works_for_the_zero_time =
  TestCase (assertEqual "Can convert time from 0 seconds to 0 0 0 AM" (Time 12 0 0 "AM") (timeFromSeconds 0))

test_timeFromSeconds_works_for_an_pm_amount_of_seconds =
  TestCase (assertEqual "Should be able to convert seconds to a time (PM)" (Time 6 34 0 "PM") (timeFromSeconds 66840))

test_timeFromSeconds_works_for_the_afternoon_time =
  TestCase (assertEqual "Should Work for 12:00:00 PM" (Time 12 0 0 "PM") (timeFromSeconds 43200))

tests = TestList [test_totalReps_works_for_a_trivial_case,
                  test_addTimes_works_for_a_simple_case_where_there_is_no_overflow,
                  test_toSeconds_works_for_the_zero_time,
                  test_toSeconds_works_for_the_zero_pm_time,
                  test_toSeconds_works_for_an_am_time,
                  test_toSeconds_works_for_a_pm_time,
                  test_timeFromSeconds_works_for_an_am_amount_of_seconds,
                  test_timeFromSeconds_works_for_the_zero_time,
                  test_timeFromSeconds_works_for_an_pm_amount_of_seconds,
                  test_timeFromSeconds_works_for_the_afternoon_time]

main = runTestTT tests
