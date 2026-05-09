module Main where

import Text.Pandoc.JSON
import IncludeFilter (doInclude)

main :: IO ()
main = toJSONFilter doInclude
