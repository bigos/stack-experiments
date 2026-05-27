module Main (main) where

-- import Lib

-- any list with elements in the Ord class can be sorted
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) = (quicksort less) ++ (x : equal) ++ (quicksort more)
  where
    less = filter (< x) xs
    equal = filter (== x) xs
    more = filter (> x) xs

quicksort' :: (Ord a) => (a -> a -> Ordering) -> [a] -> [a]
quicksort' _ [] = [] -- ignore comparison function
quicksort' c (x : xs) = (quicksort' c less) ++ (x : equal) ++ (quicksort' c more)
  where
    less = filter (\y -> y `c` x == LT) xs
    equal = filter (\y -> y `c` x == EQ) xs
    more = filter (\y -> y `c` x == GT) xs

-- exercises for descending and case insensitive

-- TODO  flipping arguments

main :: IO ()
main = do
  putStrLn "Test those functions"
  putStrLn "sorting"
  print (show (quicksort [6, 2, 5, 1, 4, 3]))
  putStrLn "higher order sorting"
  print (show (quicksort' compare [6, 2, 5, 7, 0, 1, 4, 3]))
