module Main (main) where

-- import Lib
basicIf :: Bool -> Bool
basicIf condition = if condition then True else False

numericIf :: Int -> String
numericIf n =
  if n < 0
    then "negative"
    else
      if n == 0
        then "zero"
        else "positive"

numericGuards :: Int -> String
numericGuards n
  | n < 0 = "negative"
  | n == 0 = "zero"
  | otherwise = "positive"

numericCase :: Int -> String
numericCase n = case n of
  0 -> "zero"
  1 -> "one"
  2 -> "two"
  3 -> "three"
  _ -> "error"

data Colour = Black | White | RGB Int Int Int

describeBlackOrWhite :: Colour -> String
describeBlackOrWhite c =
  "This colour is"
    ++ case c of
      Black -> " black"
      White -> " white"
      RGB 0 0 0 -> " black"
      RGB 255 255 255 -> " white"
      _ -> "... uh... something else"
    ++ ", yeah?"

-- The return () in particular evaluates to an action which does nothing.
-- return does not affect the control flow at all.

main :: IO ()
main = putStrLn "Play wit the functions"
