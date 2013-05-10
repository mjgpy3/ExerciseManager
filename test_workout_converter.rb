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

    assert_equal ["Date","Time","Push Up Sets","Reps / Set","Sit Up Sets","Reps / Set"], wc.headers
  end

end
