#!/usr/bin/env ruby

class DataParser
  def self.date text
    split_text = text.split("/")
    split_text[-1] = StringHelper.add_number_to_string 2000, split_text[-1]

    "Date " + split_text.collect {|n| StringHelper.strip_leading_zeroes n}.join(" ")
  end

  def self.time text
    words = text.split(" ")
    time_parts = words[0].split(":").collect { |n| StringHelper.strip_leading_zeroes n}

    "Time " + time_parts.join(" ") + " \"" + words[1] + "\""
  end
end

class StringHelper
  def self.add_number_to_string number, string
    (string.to_i + number).to_s
  end

  def self.strip_leading_zeroes number
    number.to_i.to_s
  end
end
