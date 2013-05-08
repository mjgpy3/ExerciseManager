module ExerciseManager where

data Exercise = RepWorkout {repsPerSet :: Int,
                            numSets :: Int}

data Date = Date {month :: Int,
                  day :: Int,
                  year :: Int}

data Time = Time {hour :: Int, 
                  minute :: Int,
                  second :: Int,
                  period :: String} -- e.g. AM or PM

data Datetime = Datetime {date :: Date,
                          time :: Time}

data Workout = BasicWorkout {repWorkouts :: [Exercise],
                             dateAndTime :: Datetime}
                             

