-- any imports go here
import Data.List

{-Begin Question 2.1-}
number :: [Int] -> Int
number = read . concatMap show

{-End Question 2.1-}

{-Begin Question 2.2-}
splits :: [a] -> [([a], [a])]
splits [] = []
splits [x] = []
splits (x : xs) = ([x], xs) : map f (splits xs)
  where
    f (z, y) = (x : z, y)

possibles :: [([Int], [Int])]
possibles = concatMap splits (permutations [1 .. 9])

isPalindrome :: [Int] -> Bool
isPalindrome x = x == reverse x

digits :: Int -> [Int]
digits = map (read . (: [])) . show

{-End Question 2.2-}

{-Begin Question 2.3-}
isAcceptable :: ([Int], [Int]) -> Bool
isAcceptable (x, y) =
  let xList = number x
      yList = number y
      xy = digits (xList * yList)
      firstDig = take 1 xy
      lastDig = take 1 (reverse (larger x y))
   in (isPalindrome xy && (firstDig == [4]) && (lastDig == [3]) && allDifferent (appList x y) && (length (appList x y)) == 9)

acceptables :: [([Int], [Int])]
acceptables = filter isAcceptable possibles
-- Around 35 Secs 

allDifferent :: [Int] -> Bool
allDifferent list = case list of
  [] -> True
  [0] -> False
  (x : xs) -> x `notElem` xs && allDifferent xs

appList :: [a] -> [a] -> [a]
appList xs ys =
  foldr (:) ys xs

larger :: [Int] -> [Int] -> [Int]
larger x y
  | length x > length y = y
  | otherwise = x

{-End Question 2.3-}

-- any main functions for testing goes here