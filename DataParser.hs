module DataParser where

import ExerciseManager
import Data.List.Split

parseDate :: String -> Date
parseDate d = Date (read $ head dl) (read $ dl !! 1) (read $ last dl)
    where dl = splitOn "/" d

parseTime :: String -> Time
parseTime t = Time (read $ head tl) (read $ tl !! 1) (read $ last tl) (last tsplit)
    where tsplit = splitOn " " t
          tl = splitOn ":" (head tsplit)
