-- Maybe Monad
f :: Int -> Maybe Int
f x = Just (x * 100)
a = 5
b = Just 5
f a  -- Just 500
b >>= f  -- Just 500
Nothing >>= f  -- Nothing
return 4 :: Maybe Int
return 4 >>= f  -- Just 400



-- List Monad
f :: Int -> [Int]
f x = [x+1]
xs = [1,2,3]
map f xsconcat
concat (map f xs)
xs >>= f
g x = [x, -x]
xs >>= g
f' :: Int -> [String]
f' x = [show x]
xs >>= f'

[1,2] >>= \x -> ['a','b'] >>= \y -> return (x,y)

foo = do
  x <- [1,2]
  y <- ['a', 'b']
  return (x, y)

  -- [(1,'a'),(1,'b'),(2,'a'),(2,'b')]

[(+1), (+2)] <*> [10, 20]  -- [11,21,12,22]

[(x, y) | x <- [1,2], y <- ['a', 'b']]
-- [(1,'a'),(1,'b'),(2,'a'),(2,'b')]

