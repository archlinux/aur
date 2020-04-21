{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}
{-# LANGUAGE QuasiQuotes #-}

import GHC.Generics
import Data.Functor
import System.IO
import Data.Array((!))
import Text.Regex.PCRE.Light
import Text.Regex.PCRE.Heavy
import Network.HTTP.Simple
import Data.Aeson as J
import Control.Monad (when)
import System.Process

data Release = Release {
      tag_name :: String
    } deriving (Generic, Show, J.FromJSON)

patchPkgbuild :: String -> String -> String
patchPkgbuild version = sub [re|pkgver=[0-9.]+\n|] $ "pkgver=" ++ version ++ "\n"

main :: IO ()
main = do
    response <- httpJSON =<< (parseRequest "https://api.github.com/repos/tree-sitter/tree-sitter/releases/latest"
                              <&> setRequestHeader "User-Agent" ["Haskell"])::IO (Response Release)
    let version = tag_name $ getResponseBody response
    putStrLn $ "Update PKGBUILD to version " ++ version
    let file = "PKGBUILD"
    contents <- readFile file
    let patched = patchPkgbuild version contents 
    when (length patched > 0) $ writeFile file patched
    callCommand "rm *.tar *.gz"
    callCommand "updpkgsums"
    callCommand "makepkg --printsrcinfo > .SRCINFO"

