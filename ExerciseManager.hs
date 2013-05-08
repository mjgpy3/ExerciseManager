module ExerciseManager where

import WorkoutFileReader
import ExerciseData
import DataParser

--workoutsFromCSV csv = [ BasicWorkout (parseDate (head header)) 
--                                (parseTime (last header))
  --                              [RepWorkout 1 2]
    --                            | l <- readCSV csv,
      --                            let (header, exercise) = splitAt 2 (tail l) ]

--main = tail =<< readCSV "workout_file.csv"

tail' [] = []
tail' (x:xs) = xs

main = do text <- readCSV "./workout_file.csv"
          tail' text
