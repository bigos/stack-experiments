module Main (main) where

import Data.List (group)
import Prelude

doubleList :: [Integer] -> [Integer]
doubleList [] = []
doubleList (n : ns) = (2 * n) : doubleList ns

tripleList :: [Integer] -> [Integer]
tripleList [] = []
tripleList (n : ns) = (3 * n) : tripleList ns

multiplyList :: Integer -> [Integer] -> [Integer]
multiplyList _ [] = []
multiplyList m (n : ns) = (m * n) : multiplyList m ns

multiplyListMap :: Integer -> [Integer] -> [Integer]
multiplyListMap m = map ((*) m)

-- rle_encoder [1,1,1,2,2,3]
rleEncoder :: Eq a => [a] -> [(a, Int)]
rleEncoder l = map (\n -> (head n, length n)) (group l)

-- rle_decoder [(1,3),(2,2),(3,1)]
rleDecoder :: Enum a => [(a, Int)] -> [a]
rleDecoder l = concat (rle_decoder0 l)
  where
    -- eta reduce, removed the l argument
    -- this was replaced by (uncurry minums) => (\(n, m) -> (mynums n m))
    rle_decoder0 = map (uncurry mynums)
    mynums n m = take m [n, n ..]

main :: IO ()
main = putStrLn "use REPL to play with the functions"
