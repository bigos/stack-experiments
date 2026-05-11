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
  | limit < 1 = Left "The limit must be one or more"
  | limit > factorialLimit = Left "You exceeded te limit"
  | otherwise = Right limit

main :: IO ()
main = do
  putStrLn "Printing  factorial"
  putStrLn ("enter number for factorial, but do not exceed " ++ show factorialLimit)
  readLimit <- getLine
  putStrLn ("thank you for entering " ++ readLimit)
  case (readMaybe readLimit :: Maybe Integer) of
    Nothing -> putStrLn "You forgot to enter correct number"
    Just numberLimit -> case validateLimit numberLimit of
      Left errorMessage -> putStrLn errorMessage
      Right limit -> do
        putStrLn "the limit looks Ok"
        putStrLn ("going  to calculate factorial for " ++ readLimit)
        putStrLn ("calculated factorial is: " ++ show (factorial limit))
