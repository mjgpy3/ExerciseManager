module WorkoutLog where

import ExerciseData

workouts = 
  [
    BasicWorkout [RepWorkout 10 7, RepWorkout 10 7] (Datetime (Date 5 6 2013) (Time 6 0 0 "PM")),
    BasicWorkout [RepWorkout 10 5, RepWorkout 10 5] (Datetime (Date 5 7 2013) (Time 6 10 0 "PM")),
  ]
