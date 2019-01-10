-- Moniods
mempty `mappend` [1,2,3]  -- [1,2,3] = [] ++ [1,2,3]
[1,2,3] `mappend` mempty  -- [1,2,3] = [1,2,3] ++ []
mappend mempty [1,2,3]  -- [1,2,3]
mappend [1,2,3] mempty  -- [1,2,3]
([1,2] `mappend` [3]) `mappend` [4]  -- [1,2,3,4] = ([1,2] ++ [3]) ++ [4]
[1,2] `mappend` ([3] `mappend` [4])  -- [1,2,3,4] = [1,2] ++ ([3] ++ [4])

"" == []  -- True
"abc" == ['a', 'b', 'c'] -- True
"abc" `mappend` mempty  -- "abc" = ['a', 'b', 'c'] ++ []
"abc" ++ ""  -- "abc" = ['a', 'b', 'c'] ++ []
"" ++ "abc"  -- "abc" = [] ++ ['a', 'b', 'c']
("a" ++ "b") ++ "c"  -- "abc" = (['a'] ++ ['b']) ++ ['c']
"a" ++ ("b" ++ "c")  -- "abc" = ['a'] ++ (['b'] ++ ['c'])
