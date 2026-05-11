module Main (main) where

-- import Lib

factorialLimit :: Integer
factorialLimit = 15

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main =
  putStrLn "Printing  factorial"
    >> putStrLn ("enter number for factorial, but do not exceed " ++ show factorialLimit)
    >> getLine >>= \readLimit ->
      let limit = (read readLimit :: Integer)
       in putStrLn ("thank you for entering " ++ readLimit)
            >> if limit < 1
              then putStrLn "the limit must be 1 or more"
              else
                if limit > factorialLimit
                  then putStrLn "you exceeded the limit"
                  else
                    putStrLn "the limit looks Ok"
                      >> putStrLn ("going  to calculate factorial for " ++ readLimit)
                      >> putStrLn ("calculated factorial is: " ++ show (factorial limit))
