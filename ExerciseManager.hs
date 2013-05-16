module ExerciseManager where

import ExerciseData
import WorkoutLog
import System.Environment

handleArgs args
 | length args /= 2 = error "Usage: runhaskell ExerciseManager.hs [task] [option]"
 | otherwise = case (head args) of
    "t" -> return (sum [totalReps ((repWorkouts i) !! (read (last args))) | 
                        i <- (snd workouts)])

printMenu = putStrLn (getLineString [t | t <- (zip [0..] (fst workouts))])

getLineString [] = ""
getLineString (x:xs) = (show (fst x)) ++ " - " ++ (snd x) ++ "\n" ++ (getLineString xs)

main = do
    printMenu
    a <- getArgs
    handleArgs a
