import System.IO

f x = x + 5
g x = x * 3
h x = x - 1

f1 = id f
f2 = f . id
f3 = id . f
g1 = id g
g2 = g . id
g3 = id . g

fg = f . g
gf = g . f
h_gf = h . (g . f)
hg_f = (h . g) . f

start x = do
  putStrLn $ "x = " ++ show x
  putStrLn $ "id x = " ++ show (id x)
  putStrLn $ "f x = " ++ show (f x)
  putStrLn $ "f1 x = " ++ show (f1 x)
  putStrLn $ "f2 x = " ++ show (f2 x)
  putStrLn $ "f3 x = " ++ show (f3 x)
  putStrLn $ "g x = " ++ show (g x)
  putStrLn $ "g1 x = " ++ show (g1 x)
  putStrLn $ "g2 x = " ++ show (g2 x)
  putStrLn $ "g3 x = " ++ show (g3 x)
  putStrLn $ "fg x = " ++ show (fg x)
  putStrLn $ "gf x = " ++ show (gf x)
  putStrLn $ "h_gf x = " ++ show (h_gf x)
  putStrLn $ "hg_f x = " ++ show (hg_f x)

-- x
-- id x
-- f x
-- f1 x
-- f2 x
-- f3 x
-- g x
-- g1 x
-- g2 x
-- g3 x
-- fg x
-- gf x
-- h_gf x
-- hg_f x