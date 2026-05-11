module Main (main) where

-- import Lib

factorialLimit :: Integer
factorialLimit = 15

myFactorial :: Integer -> Integer
myFactorial num = factorial num
  where
    factorial 0 = 1
    factorial n = n * factorial (n - 1)

main :: IO ()
main =
  putStrLn "Printing  factorial"
    >> putStrLn ("enter number for factorial, but do not exceed " ++ show factorialLimit)
    >> getLine >>= \theLimit ->
      putStrLn ("thank you for entering " ++ theLimit)
        >> if (read theLimit :: Integer) < 1
          then putStrLn "the limist must be 1 or more"
          else
            if (read theLimit :: Integer) <= factorialLimit
              then
                putStrLn "the limit looks Ok"
                  >> putStrLn ("going  to calculate factorial for " ++ theLimit)
                  >> putStrLn ("calculated factorial is: " ++ show (myFactorial (read theLimit :: Integer)))
              else putStrLn "you exceeded the limit"
