module Main (main) where

-- import Lib

factorialLimit :: Integer
factorialLimit = 5

main :: IO ()
main =
  putStrLn "Printing  factorial"
    >> putStrLn ("enter number for factorial, but do not exceed " ++ show factorialLimit)
    >> getLine >>= \readFactorialLimit ->
      (read readFactorialLimit :: Integer)
        >>= \intFactorialLimit ->
          if (intFactorialLimit < 1)
            then putStrLn "the limit must be greater than 1"
            else
              putStrLn
                ("thank you for entering " ++ readFactorialLimit)
