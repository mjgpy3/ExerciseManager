#!/usr/bin/env ruby

=begin
  Used to convert csv files that follow the form of "workout_file.csv"
  into Haskell source code files (usually "WorkoutLog.hs", but other
  things _can_ be used)
=end

require './data_parser'

class WorkoutConverter
  @@imports = ["ExerciseData"]

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

  def convert_workout_file input_file_name, output_file_name
     read_workout_file input_file_name

     write_converted_file output_file_name
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

  def write_converted_file file_name
    file_out = File.new(file_name, 'w')

    # Writing stuff, subject to change
    file_out.write "module " + get_module_name(file_name) + " where\n\n"

    @@imports.each do |module_name|
      file_out.write "import " + module_name + "\n"
    end

    file_out.write "\nworkouts = \n  ([" +
                   quotify_strings(@headers[2..-1]).join(', ')+"],[\n"

    data_lines = get_converted_data.collect { |x| "    " + x}

    file_out.write data_lines.join(",\n")

    file_out.write "\n  ])\n"

    file_out.close
  end

  def get_module_name path
    path.split("/")[-1][0..-4]
  end

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

  def quotify_strings strings
    strings.collect {|s| '"' + s + '"'}
  end
end

def usage_and_exit
  puts "Usage: [input_file].csv [output_file].hs"
  exit
end

if __FILE__ == $0
  usage_and_exit if ARGV.length != 2

  wc = WorkoutConverter.new
  wc.convert_workout_file ARGV[0], ARGV[1]
end
