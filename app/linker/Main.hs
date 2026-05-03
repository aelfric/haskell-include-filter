
module Main where

-- includes.hs
import Data.Char
import Text.Pandoc.JSON
import Text.Pandoc
import Text.Pandoc.Error
import qualified Data.Text.IO as TIO
import qualified Data.Text as T
import Control.Monad

toPhone :: String -> String
toPhone str = "sms:+1" ++ (filter isDigit str)

acronym :: Inline -> Inline
acronym l@(Link attrs  [Str content] (target, _)) = 
  case T.unpack target of 
    "sms" -> Link nullAttr [(Str content)] (T.pack (toPhone $ T.unpack(content)),T.empty)
    "email" -> Link nullAttr [(Str content)] (T.pack ("mailto:" ++ T.unpack(content)),T.empty)
    _ -> l
acronym other = other

main :: IO ()
main = toJSONFilter acronym

