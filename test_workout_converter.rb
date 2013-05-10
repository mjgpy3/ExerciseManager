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

=begin
  def test_WorkoutConverter_correctly_makes_haskell_code_from_data
    wc = WorkoutConverter.new
    wc.read_workout_file "./TestFiles/testfile2.csv"

    answer = wc.get_converted_data
    expected = ["", ""]

    assert_equal expected, answer
  end
=end
end
