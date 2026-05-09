import Test.Hspec
import Text.Pandoc
import qualified Data.Text as T
import IncludeFilter (doInclude)
import System.IO.Temp (withSystemTempFile)
import System.IO (hPutStr, hClose)

attr :: String -> String -> (T.Text, T.Text)
attr k v = (T.pack k, T.pack v)

main :: IO ()
main = hspec $ do
  describe "doInclude filter" $ do
    it "replaces code block with included file contents" $ do    
      -- Write the included file
      writeFile "test.md" "# Hello"

      withSystemTempFile "test.md" $ \path handle -> do
        hPutStr handle "# Hello"
        hClose handle

        -- Parse input
        let pandoc =
              Pandoc nullMeta
                [ CodeBlock (T.pack "", [], [(attr "include" path)])
                            (T.pack "ignored")
                ]

        -- Apply filter
        let Pandoc _ blocks = pandoc
        blocks' <- concat <$> mapM doInclude blocks

        -- Check result
        blocks' `shouldBe` [Header 1 (T.pack(""),[],[]) [Str (T.pack("Hello"))]]