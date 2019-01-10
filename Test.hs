import qualified Data.Map as Map

addTo :: Int -> Int
addTo 0 = 0
addTo x = x + addTo (x - 1)

addList :: [Int] -> Int
addList xs = case xs of
  [] -> 0
  x:ts -> x + addList ts

fibonacci :: (Eq a, Num a) => a -> a
-- fibonacci 0 = 0
-- fibonacci 1 = 1
-- fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

-- fibonacci x = case x of
--   0 -> 0
--   1 -> 1
--   otherwise -> fibonacci (x - 1) + fibonacci (x - 2)

fibonacci x
  | x == 0 = 0
  | x == 1 = 1
  | otherwise = fibonacci (x - 1) + fibonacci (x - 2)

listFibonacci :: Int -> [Int]
listFibonacci x = [fibonacci a | a <- [1..x]]

maxInList :: Ord a => [a] -> a
maxInList [] = error "empty list"
maxInList [x] = x
-- maxInList (x:ts)
--     | x < maxTail = maxTail
--     | otherwise = x
--     where maxTail = maxInList ts
maxInList (x:ts) = max x maxTail
    where maxTail = maxInList ts

takeInList :: (Num a, Ord a) => a -> [a] -> [a]
-- takeInList x xs
--   | length xs == 0 = []
--   | x <= 0 = []
--   | otherwise = head xs : takeInList (x-1) (tail xs)
takeInList n _
  | n <= 0 = []
takeInList _ [] = []
takeInList n (x:xs) = x : takeInList (n-1) xs

reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

zipLists :: [a] -> [b] -> [(a, b)]
zipLists [] _ = []
zipLists _ [] = []
zipLists (x:xs) (y:ys) = (x, y) : zipLists xs ys

elemInList :: Eq a => a -> [a] -> Bool
elemInList _ [] = False
elemInList a (x:xs)
  | a == x = True
  | otherwise = elemInList a xs


quicksort :: Ord a => [a] -> [a]
quicksort [] = []
-- quicksort ts@(x:xs) = smallers ++ equals ++ biggers
--   where smallers = quicksort [a | a <- xs, a < x]
--         equals = [a | a <- ts, a == x]
--         biggers = quicksort [a | a <- xs, a > x]
quicksort ts@(x:xs) =
  let smallers = quicksort [a | a <- xs, a < x]
      equals = [a | a <- ts, a == x]
      biggers = quicksort [a | a <- xs, a > x]
  in smallers ++ equals ++ biggers

filterList :: (a -> Bool) -> [a] -> [a]
filterList p xs = [a | a <- xs, p a]

-- chain :: Integral a => a -> [a]
chain :: Int -> [Int]
chain 1 = [1]
chain n
  | even n = n : chain(n `div` 2)
  | odd n = n : chain(n * 3 + 1)

foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' _ acc [] = acc
foldl' p acc (x:xs) = foldl' p (p acc x) xs

foldr' :: (b -> a -> a) -> a -> [b] -> a
foldr' _ acc [] = acc
foldr' p acc xs = foldr' p (p (last xs) acc) (init xs)

foldl1' :: (a -> a -> a) -> [a] -> a
foldl1' _ [x] = x;
foldl1' p (x:xs) = foldl' p x xs

foldr1' :: (a -> a -> a) -> [a] -> a
foldr1' _ [x] = x
foldr1' p xs = foldr' p (last xs) (init xs)

scanl' :: (a -> b -> a) -> a -> [b] -> [a]
scanl' _ acc [] = [acc]
scanl' p acc (x:xs) = acc : (scanl' p (p acc x) xs)

scanr' :: (b -> a -> a) -> a -> [b] -> [a]
scanr' _ acc [] = [acc]
scanr' p acc xs = (scanr' p (p (last xs) acc) (init xs)) ++ [acc]

scanl1' :: (a -> a -> a) -> [a] -> [a]
scanl1' _ [x] = [x]
scanl1' p (x:xs) = scanl' p x xs

scanr1' :: (a -> a -> a) -> [a] -> [a]
scanr1' _ [x] = [x]
scanr1' p xs = scanr' p (last xs) (init xs)

even' :: Int -> Bool
even' = ((==) 0) . (`mod` 2)

odd' :: Int -> Bool
odd' = ((==) 1) . (`mod` 2)

intersperse' :: a -> [a] -> [a]
intersperse' _ [] = []
intersperse' _ [x] = [x]
intersperse' a (x:xs) = x:a:intersperse' a xs

reduce [] f acc = acc
reduce (x:xs) f acc = reduce xs f $ f x acc
