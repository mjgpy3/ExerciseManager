module WorkoutLog where

import ExerciseData

workouts = 
  [
    BasicWorkout [RepWorkout 10 7, RepWorkout 10 7] (Datetime (Date 5 6 2013) (Time 6 0 0 "PM")),
    BasicWorkout [RepWorkout 10 5, RepWorkout 10 5] (Datetime (Date 5 7 2013) (Time 6 10 0 "PM")),
    BasicWorkout [RepWorkout 10 5, RepWorkout 10 5] (Datetime (Date 5 8 2013) (Time 6 10 0 "PM")),
    BasicWorkout [RepWorkout 10 5, RepWorkout 10 5] (Datetime (Date 5 9 2013) (Time 7 20 0 "PM")),
    BasicWorkout [RepWorkout 10 2, RepWorkout 10 3] (Datetime (Date 5 10 2013) (Time 11 0 0 "PM")),
    BasicWorkout [RepWorkout 10 6, RepWorkout 10 6] (Datetime (Date 5 11 2013) (Time 7 45 0 "PM")),
    BasicWorkout [RepWorkout 10 7, RepWorkout 10 7] (Datetime (Date 5 13 2013) (Time 4 45 0 "AM")),
    BasicWorkout [RepWorkout 10 17, RepWorkout 10 17] (Datetime (Date 5 15 2013) (Time 10 0 0 "AM")),
    BasicWorkout [RepWorkout 10 9, RepWorkout 10 9] (Datetime (Date 5 15 2013) (Time 2 20 0 "PM"))
  ]
