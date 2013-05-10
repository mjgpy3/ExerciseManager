#!/usr/bin/env ruby

require './data_parser'

class WorkoutConverter
  def read_workout_file file_name
    file = File.new file_name, 'r'

    @text = file.read
    @headers = get_headers
    @data = get_data

    file.close
  end

  def get_converted_data
    @data.collect do |datum|
      "BasicWorkout [" + get_reversed_pairs(datum[2..-1]).join(", ") +
      "] (Datetime (" + DataParser.date(datum[0]) + ") (" + 
      DataParser.time(datum[1]) + "))"
    end
  end

  def text
    @text
  end

  def headers
    @headers
  end

  def data
    @data
  end

private

  def get_headers
    @text.split("\n")[0].split(",")
  end

  def get_data
    @text.split("\n")[1..-1].collect { |l| l.split(",")}
  end

  def get_reversed_pairs data
    result = []

    0.upto(data.length/2-1) do |i|
        result << "RepWorkout " + data.slice(0+2*i, 2+2*i).reverse.join(" ")
    end

    result
  end
end
