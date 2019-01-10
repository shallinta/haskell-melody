-- Just 3 >>= (\x -> Just (show x ++ "!"))  -- Just "3!"
-- Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))  -- Just "3!"

foo = Just 3 >>= (\x ->
      Just "!" >>= (\y ->
      Just (show x ++ y)))
-- Just "3!"

bar = do
  x <- Just 3
  y <- Just "!"
  Just (show x ++ y)
-- Just "3!"


welcome = do
  name <- getLine
  greeting <- return "Hello, "
  putStrLn (greeting ++ name)

welcome2 = getLine >>= (\name ->
    return "Hello, " >>= (\greeting ->
    putStrLn (greeting ++ name)))

