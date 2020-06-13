{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module UserApi where

import Prelude.Compat
import Data.Aeson (decode,encode)
import Data.Aeson.TH (deriveJSON, defaultOptions)
import Servant

data User = User { userId :: Int , userFirstName :: String , userLastName :: String } deriving (Eq,Show)

$(deriveJSON defaultOptions ''User)

type UserAPI = "users" :> Get '[JSON] [User]

app :: Application
app = serve userAPI server

userAPI :: Proxy UserAPI
userAPI = Proxy

server :: Server UserAPI
server = return users

users :: [User]
users = [User 1 "S" "M" , User 2 "A" "G"]



