module WorkoutFileReader where

readWorkoutFile f = do
    t   <- readFile f
    return t
