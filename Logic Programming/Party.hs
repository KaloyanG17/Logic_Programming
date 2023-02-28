-- any imports go here

{-Begin Question 1.1-}
digits :: Int -> [Int]
digits = map (read . (: [])) . show

{-End Question 1.1-}

{-Begin Question 1.2-}
isPar :: Int -> Bool
isPar x =
  let fir = firstTwo x; sec = lastTwo x; lis = digits x
   in (sec `mod` fir == 0) && (allDifferent lis)

-- Gets first 2 ints
firstTwo :: Int -> Int
firstTwo x
  | (length . show $ x) == 4 = read . take 2 . show $ x
  | otherwise = error "The number doesnt have 4 digits"

--Gets last 2 ints
lastTwo :: Int -> Int
lastTwo x
  | (length . show $ x) == 4 = read . drop 2 . show $ x
  | otherwise = error "The number doesnt have 4 digits"

--Checks all ints are different
allDifferent :: [Int] -> Bool
allDifferent list = case list of
  [] -> True
  [0] -> False
  (x : xs) -> x `notElem` xs && allDifferent xs

pars :: [Int]
pars = filter isPar [1111 .. 9999]

{-End Question 1.2-}

{-Begin Question 1.3-}
isParty :: (Int, Int) -> Bool
isParty (x, y) =
  let lis = appList lis1 lis2
      lis1 = digits x
      lis2 = digits y
      digFind = sum lis
      dig = 45 - digFind
      in allDifferent lis && ((x `mod` dig == 0) && (y `mod` dig == 0)) 

--Append list
appList :: [a] -> [a] -> [a]
appList xs ys =
  foldr (:) ys xs

partys :: [(Int, Int)]
partys = filter isParty [(x, y) | x <- [1111 .. 9999], isPar x, y <- [1111 .. 9999], isPar y]


{-End Question 1.3-}

-- any main functions for testing goes here