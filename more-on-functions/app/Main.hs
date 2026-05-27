module Main (main) where

import Prelude (Float, IO, String, foldl, print, putStrLn, read, show, (+))

sumStrLet :: [String] -> Float
sumStrLet =
  let addStr x str = x + read str
   in foldl addStr 0.0

sumStrWhere :: [String] -> Float
sumStrWhere = foldl addStr 0.0
  where
    addStr x str =
      x + read str

sumStrLambda :: [String] -> Float
sumStrLambda = foldl (\a str -> a + read str) 0.0

main :: IO ()
main = do
  putStrLn "Play with those functions"
  print (show (sumStrLet ["1", "2"]))
  putStrLn " --- "
  print (show (sumStrWhere ["3", "4"]))
  putStrLn " --- "
  print (show (sumStrLambda ["5", "6"]))
