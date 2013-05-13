module ExerciseData where

data Exercise = RepWorkout {repsPerSet :: Int,
                            numSets :: Int}

totalReps :: Exercise -> Int
totalReps e = (repsPerSet e) * (numSets e)

data Date = Date {month :: Int,
                  day :: Int,
                  year :: Int} deriving (Eq, Show)

data Time = Time {hour :: Int,
                  minute :: Int,
                  second :: Int,
                  period :: String} deriving (Eq, Show) -- e.g. AM or PM

addTimes :: Time -> Time -> Time
addTimes (Time h1 m1 s1 p1) (Time h2 m2 s2 p2) = Time 10 13 37 "PM"

toSeconds :: Time -> Int
toSeconds (Time h m s p)
 | p == "AM" = h*3600 + m*60 + s
 | p == "PM" = 43200 + h*3600 + m*60 + s
 | otherwise = error "Invalid time entered"

timeFromSeconds :: Int -> Time
timeFromSeconds s = Time numHours numMinutes numSeconds period
  where period = if s < 43200 then "AM" else "PM"
        s2 = if s >= 43200 then s - 43200 else s
        numHours = if s2 `quot` 3600 == 0 then 12 else s2 `quot` 3600 
        numMinutes = (s2 `mod` 3600) `quot` 60
        numSeconds = (s2 `mod` 3600) `mod` 60

data Datetime = Datetime {date :: Date,
                          time :: Time}

data Workout = BasicWorkout {repWorkouts :: [Exercise],
                             dateAndTime :: Datetime}

