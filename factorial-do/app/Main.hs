module Main (main) where

-- import Lib

factorialLimit :: Integer
factorialLimit = 15

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
  putStrLn "Printing  factorial"
  putStrLn ("enter number for factorial, but do not exceed " ++ show factorialLimit)
  readLimit <- getLine
  putStrLn ("thank you for entering " ++ readLimit)
  let limit = (read readLimit :: Integer)
   in if limit < 1
        then putStrLn "the limit must be 1 or more"
        else
          if limit > factorialLimit
            then putStrLn "you exceeded the limit"
            else do
              putStrLn "the limit looks Ok"
              putStrLn ("going  to calculate factorial for " ++ readLimit)
              putStrLn ("calculated factorial is: " ++ show (factorial limit))
