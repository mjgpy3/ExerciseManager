module DataParser where

import ExerciseManager
import Data.List.Split

parseStandardDate d = Date (read $ head dl) (read $ dl !! 1) (read $ last dl)
    where dl = splitOn "/" d
