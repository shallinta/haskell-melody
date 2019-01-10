f x = x + 1
g x = x * 2
f 4 -- 5
g 4 -- 8

fmap f (Just 4) -- Just 5
f' = fmap f
f' Nothing -- Nothing
f' (Just 4) -- Just 5

id' = fmap id
id (Just 4) -- Just 4
id' (Just 4) -- Just 4

(g.f) 4 -- 10
fmap (g.f) (Just 4) -- Just 10
(fmap g . fmap f) (Just 4) -- Just 10


arr = [1,2,3,4,5]
fmap f arr -- [2,3,4,5,6]
fmap (g.f) arr -- [4,6,8,10,12]
(fmap g . fmap f) arr -- [4,6,8,10,12]
fmap id arr -- [1,2,3,4,5]

fmap (fmap f) (Just [1,2,3,4,5]) -- Just [2,3,4,5,6]

j x = Just (x + 1)
fmap j arr -- [Just 2, Just 3, Just 4, Just 5, Just 6]

