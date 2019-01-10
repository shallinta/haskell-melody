-- 函数定义与函数调用
add x y = x + y
add 1 2  -- 3
sum x y z = x + y + z
sum 1 2 3  -- 6

-- 函数科里化
add1 = add 1
add1 2  -- 3
sum1 = sum 1
sum1 2 3  -- 6
sum1_2 = sum1 2
sum1_2 3  -- 6

-- 中缀函数与前缀函数
1 + 2  -- 3
(+) 1 2  -- 3
add 1 2  -- 3
1 `add` 2  -- 3
2 `sum1` 3  -- 6
map add1 [5,6,7]  -- [6,7,8]
add1 `map` [5,6,7]  -- [6,7,8]

-- 数组
[1,2,3,4,5] == 1:2:3:4:5:[] == 1:[2,3,4,5]
1:[2,3,4,5] == [1] ++ [2,3,4,5]
:t 'a'  -- Char
:t "a"  -- String -- [Char]
"abcd" == 'a':'b':'c':'d' == ['a', 'b', 'c', 'd']
'a':"bcd" == "a" ++ "bcd" == 'a':['b','c','d'] == "ab" ++ ['c', 'd']

-- Tuple
t1 = (1,4)
t2 = (6,8,10)
t3 = (1, 'a', True, "haskell")

-- Maybe
-- Maybe a = Nothing | Just a
-- List a = [a]
j1 = Just 'a'
j2 = Just 1
j3 = Nothing
:t j1  -- Maybe Char
:t j3  -- Maybe a

-- 函数模式匹配与解构
first :: [a] -> a
first [] = error "空数组"
first (x:xs) = x  -- first (x:_) = x
first []  -- *** Exception: 空数组 ...
first [1,2,3]  -- 1
first' :: [a] -> Maybe a
first' [] = Nothing
first' (x:_) = Just x
first' []  -- Nothing
first' [1,2,3]  -- Just 1
isRtTriangle tuple :: (Num a, Eq a) => (a, a, a) -> Bool
isRtTriangle (x,y,z) = (x*x + y*y) == z*z
isRtTriangle t2  -- True
returnJust :: Maybe a -> a
returnJust (Just x) = x

-- lamda表达式
add x y = x + y
add' = \x y -> x + y
add' 1 2  -- 3
(\x y -> x + y) 1 2  -- 3
add1' = \x -> x + 1
map add1' [5,6,7]  -- [6,7,8]
map (\x -> x + 1) [5,6,7]  -- [6,7,8]

