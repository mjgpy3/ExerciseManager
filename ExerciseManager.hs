module ExerciseManager where

import ExerciseData
import WorkoutLog
import System.Environment

handleArgs args
 | length args /= 2 = error "Usage: runhaskell ExerciseManager.hs [task] [option]"
 | otherwise = case (head args) of
    "t" -> return (sum [totalReps ((repWorkouts i) !! (read (last args))) | i <- workouts])

main = do
    a <- getArgs
    handleArgs a
