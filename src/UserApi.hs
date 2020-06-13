{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module UserApi where

import Prelude.Compat
import Data.Aeson (decode,encode)
import Data.Aeson.TH (deriveJSON, defaultOptions)

data User = User { userId :: Int , userFirstName :: String , userLastName :: String } deriving (Eq,Show)

$(deriveJSON defaultOptions ''User)

users :: [User]
users = [User 1 "S" "M" , User 2 "A" "G"]



