module WorkoutFileReader (readCSV) where

import System.Environment
import Data.List.Split

readCSV f = do
    t <- readFile f
    return (csvLinesToList (lines t))

csvLinesToList [] = []
csvLinesToList csv = [splitOn "," l | l <- csv]

main = readCSV "TestFiles/testfile1.csv"
