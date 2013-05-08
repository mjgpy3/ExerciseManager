module ExerciseManager where

import WorkoutFileReader

data Exercise = RepWorkout {repsPerSet :: Int,
                            numSets :: Int}

data Date = Date {month :: Int,
                  day :: Int,
                  year :: Int} deriving (Eq, Show)

data Time = Time {hour :: Int, 
                  minute :: Int,
                  second :: Int,
                  period :: String} deriving (Eq, Show) -- e.g. AM or PM

data Datetime = Datetime {date :: Date,
                          time :: Time}

data Workout = BasicWorkout {repWorkouts :: [Exercise],
                             dateAndTime :: Datetime}
                             
-- workoutsFromCSV csv = [  | l <- (tail $ readCSV csv)]
