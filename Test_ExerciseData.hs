module Test_ExerciseData where

import Test.HUnit
import ExerciseData

test_totalReps_works_for_a_trivial_case =
  TestCase (assertEqual "total reps should be reps/set times sets" 48 (totalReps (RepWorkout 12 4)))

tests = TestList [test_totalReps_works_for_a_trivial_case]

main = runTestTT tests
