#!/usr/bin/env ruby

require 'test/unit'
require './workout_converter'

class TestWorkoutConverter < Test::Unit::TestCase

  def test_reading_a_workout_file_works
    wc = WorkoutConverter.new
    wc.read_workout_file "./TestFiles/testfile1.csv"

    answer = wc.text
    expected = "this is a simple file\nwith a few lines\n"

    assert_equal expected, answer
  end

  def test_reading_a_workout_file_correctly_gets_headers
    wc = WorkoutConverter.new
    wc.read_workout_file "./TestFiles/testfile2.csv"

    answer = wc.headers
    expected = ["Date","Time","Push Up Sets","Reps / Set","Sit Up Sets","Reps / Set"]

    assert_equal expected, answer
  end

  def test_reading_a_workout_file_correctly_gets_data
    wc = WorkoutConverter.new
    wc.read_workout_file "./TestFiles/testfile2.csv"

    answer = wc.data
    expected = [["05/06/13" ,"06:00:00 PM", "7", "10", "7", "10"],
                ["05/07/13", "06:10:00 PM", "5", "10", "5", "10"]]

    assert_equal expected, answer
  end

  def test_WorkoutConverter_correctly_makes_haskell_code_from_data
    wc = WorkoutConverter.new
    wc.read_workout_file "./TestFiles/testfile2.csv"

    answer = wc.get_converted_data
    expected = ["BasicWorkout [RepWorkout 10 7, RepWorkout 10 7] (Datetime (Date 5 6 2013) (Time 6 0 0 \"PM\"))",
                "BasicWorkout [RepWorkout 10 5, RepWorkout 10 5] (Datetime (Date 5 7 2013) (Time 6 10 0 \"PM\"))"]

    assert_equal expected, answer
  end

  def test_convert_workout_file_works_expectedly
    wc = WorkoutConverter.new
    wc.convert_workout_file "./TestFiles/testfile2.csv", "./TestFiles/WorkoutLog.hs"

    output_file = File.open("./TestFiles/WorkoutLog.hs", 'r')
    answer = output_file.read
    output_file.close

    expected_file = File.new("TestFiles/WorkoutLog_Expected.hs", 'r')
    expected = expected_file.read
    expected_file.close

    assert_equal expected, answer

    # Delete the extra created file
    `rm ./TestFiles/WorkoutLog.hs`
  end
end
