module Main (main) where

type Name = String

data Anniversary = Birthday Name Date | Wedding Name Name Date

data Date = Date Int Int Int -- Year, Month, Day

johnSmith :: Anniversary
johnSmith = Birthday "John Smith" (Date 1968 7 3)

smithWedding :: Anniversary
smithWedding = Wedding "John Smith" "Jane Smith" (Date 1987 3 4)

type AnniversaryBook = [Anniversary]

anniversariesOfJohnSmith :: AnniversaryBook
anniversariesOfJohnSmith = [johnSmith, smithWedding]

showDate :: Date -> String
showDate (Date y m d) = show y ++ "-" ++ show m ++ "-" ++ show d

showAnniversary :: Anniversary -> String
showAnniversary (Birthday name date) = name ++ " born " ++ showDate date
showAnniversary (Wedding name1 name2 date) = name1 ++ " married " ++ name2 ++ " on " ++ showDate date

main :: IO ()
main = putStrLn "Play with the functions"
