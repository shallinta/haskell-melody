-- foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ acc [] = acc
foldl' f acc (x:xs) = foldl f (f acc x) xs

-- sum' :: Num a => [a] -> a
sum' = foldl' (\acc x -> acc + x) 0
product' = foldl' (\acc x -> acc * x) 1
