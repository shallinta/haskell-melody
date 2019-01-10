-- applicative functor
Just (*3) <*> Just 5 -- Just 15
pure (*3) <*> Just 5 -- Just 15
apadd5 = pure (+) <*> Just 5 -- fmap (+) (Just 5) -- Just (+5)
apadd5 <*> Just 5 -- Just 10
pure (+) <*> Just 5 <*> Just 5 -- Just 10
fmap (+) (Just 5) <*> Just 5 -- Just 10
(+) <$> Just 5 <*> Just 5 -- Just 10

sum3 x y z = x + y + z
sum3 <$> Just 1 <*> Just 2 <*> Just 3 -- Just 6

s = [1, 2, 3]
fs = fmap (+) s -- [(+1), (+2), (+3)]
xs = [10, 20, 30, 40, 50]
fs <*> xs -- [11,21,31,41,51,12,22,32,42,52,13,23,33,43,53]
(+) <$> s <*> xs -- [11,21,31,41,51,12,22,32,42,52,13,23,33,43,53]
(*) <$> s <*> xs -- [10,20,30,40,50,20,40,60,80,100,30,60,90,120,150]

