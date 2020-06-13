module Main where

import Lib
import UserApi
import Network.Wai.Handler.Warp (run)

main :: IO ()
main = run 8081 app
