module Main where

solveRPN :: String -> Float
solveRPN = head . foldl foldingFunction [] . words
    where foldingFunction (x:y:xs) "*" = (x * y) : xs
          foldingFunction (x:y:xs) "+" = (x + y) : xs
          foldingFunction (x:y:xs) "-" = (y - x) : xs
          foldingFunction xs "sum" = [sum xs]
          foldingFunction xs n = read n : xs

main :: IO ()
main = do
    getLine >>= print . solveRPN
