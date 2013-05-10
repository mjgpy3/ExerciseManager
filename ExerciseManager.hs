module ExerciseManager where

import WorkoutFileReader
import ExerciseData
import DataParser

main = do text <- readCSV "./workout_file.csv"
          tail' text
