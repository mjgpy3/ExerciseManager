#!/usr/bin/env ruby

class WorkoutConverter
  def read_workout_file file_name
    file = File.new file_name, 'r'
    @text = file.read
    @headers = get_headers
    @data = get_data
    file.close
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
end
