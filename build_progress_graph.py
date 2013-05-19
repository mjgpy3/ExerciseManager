#!/usr/bin/env python

"""
    Constructs a PNG graph of workout data
"""

#from pylab import *
from datetime import datetime

class DataReader(object):
    """
        In charge of reading in a csv file with workout data
    """
    def __init__(self):
        self.data = {}
        
    def read_data(self, file_name):
        """
            Reads lines of the given file_name and fills the data list
        """
        with open(file_name, 'r') as file_stream:
            text = file_stream.read()

        # Ignore the first line, it should have headers, last line is most
        # assuredly blank
        data_lines = text.split("\n")[1:-1]

        for line in data_lines:
            data_line = DataLine()
            data_line.set_from_csv_line(line)
            self.data[data_line.date_time] = data_line.rep_workouts

class DataLine(object):
    """
        The date, time and workout data
    """
    def __init__(self):
        self.date_time = None
        self.rep_workouts = []

    def set_from_csv_line(self, csv_line):
        data_from_line = csv_line.split(",")

        # Assumption: date, time, 2 rep workouts
        assert len(data_from_line) == 6

        self.date_time = parse_datetime_from_standard_date_and_time(
                                                            data_from_line[0],
                                                            data_from_line[1] )

        # Assumption: from the 21st char on we should have csv workouts, which
        # look a lot like the inside of a list
        self.rep_workouts = eval("[" + csv_line[21:] + "]")

def parse_datetime_from_standard_date_and_time(date, time):
    date_parts = parse_standard_date(date)
    time_parts = parse_standard_time(time)
    
    current_mill = (datetime.now().year / 1000)*1000

    # Assumption: Date is in the form YY so the current
    # year is actually YY + current millenium
    date_time = datetime( current_mill + date_parts[2],
                          date_parts[0],
                          date_parts[1],
                          time_parts[0],
                          time_parts[1],
                          time_parts[2] )

    return date_time

def parse_standard_date(date):
    """
        Takes a string of the form "MM/DD/YY" and returns a list of ints that 
        looks like [MM, DD, YY]
    """
    return [ int(i) for i in date.split("/") ]

def parse_standard_time(time):
    """
        Takes a string of the form "HH:MM:SS PD" and returns a list of ints 
        that looks like [HH, MM, SS] (<PD> is period AM|PM).
    """
    parts = time.split(" ")

    assert len(parts) == 2

    int_parts = [ int(i) for i in parts[0].split(":") ] + [parts[-1]]

    if parts[1] == "PM":
        int_parts[0] += 12

    return int_parts
