module Main (main) where

-- import Lib
import Text.Read (readMaybe)

factorialLimit :: Integer
factorialLimit = 15

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

validateLimit :: Integer -> Either String Integer
validateLimit limit
  | limit < 1 = Left "The limit must be 1 or more"
  | limit > factorialLimit = Left "You exceeded te limit"
  | otherwise = Right limit

parseInput :: String -> Either String Integer
parseInput str =
  case (readMaybe str :: Maybe Integer) of
    Nothing -> Left "You forgot to enter correct number"
    Just numberLimit -> case validateLimit numberLimit of
      Left errorMessage -> Left errorMessage
      Right limit -> Right limit

main :: IO ()
main =
  putStrLn "Printing  factorial"
    >> putStrLn ("enter number for factorial, but do not exceed " ++ show factorialLimit)
    >> getLine >>= \readLimit ->
      putStrLn ("thank you for entering " ++ readLimit)
        >> case parseInput readLimit of
          Left errorMessage -> putStrLn errorMessage
          Right limit ->
            putStrLn "the limit looks Ok"
              >> putStrLn ("going  to calculate factorial for " ++ readLimit)
              >> putStrLn ("calculated factorial is: " ++ show (factorial limit))
