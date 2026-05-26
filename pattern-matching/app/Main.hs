module Main (main) where

-- import Lib
--

-- myMap is my definition of map, it uses destructuring for pattern matching on arguments

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap fn (x : xs) = fn x : map fn xs

-- only constructors are allowed on the pattern matching side
data Foo = Bar | Baz Int

fooba :: Foo -> Int
fooba Bar = 1
fooba (Baz x) = x - 1

data Date = Date Int Int Int -- Year, Month, Day

showDate :: Date -> String
showDate (Date y m d) = show y ++ "-" ++ show m ++ "-" ++ show d

-- my own implementation of join
showDate2 (Date y m d) = Prelude.foldl (\a n -> a ++ separator a ++ show n) "" [y, m, d]
  where
    separator a =
      if a == ""
        then ""
        else "--"

-- [x, y, z] is a syntactic sugar for x:y:z:[]
dropThree (_ : _ : _ : xs) = xs

-- destructuring tuples
fstPlusSnd (x, y) = x + y

-- matching literal values
efx :: Int -> Int
efx 0 = 1
efx 1 = 2
efx 2 = 3
efx _ = -1

egx :: [Int] -> Bool
egx [0] = False
egx (0 : xs) = True
egx _ = False

-- skipped as patterns

-- introduction to records
data Foo2 = Bar2 | Baz2 {bazNumber :: Int, bazName :: String}

-- extract the length of bazBane with syntax sugar
hgx :: Foo2 -> Int
hgx Baz2 {bazName = name} = length name

-- surprise
-- Also, the {} pattern can be used for matching a constructor regardless of the datatype elements even if you don't use records in the data declaration:

-- review list comprehension again
data Maybe a = Nothing | Just a

-- takes a list of Maybes (which may contain both "Just" and "Nothing" Maybes), and retrieves the contained values by filtering out the Nothing values and getting rid of the Just wrappers of the Just x. Writing it with list comprehensions is very straightforward:

catMaybes :: [Maybe a] -> [a]
catMaybes ms = [x | Just x <- ms]

main :: IO ()
main = putStrLn "Play with the code"
