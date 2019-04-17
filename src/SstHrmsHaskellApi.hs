{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module SstHrmsHaskellApi
    ( runApp
    )
where

import Api.HealthCheck (HealthCheckApi, healthCheckHandler)
import Data.Maybe (fromMaybe)
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import System.Environment.Blank (getEnv)
import Text.Read (read)

type API = HealthCheckApi

server :: Server API
server = healthCheckHandler

api :: Proxy API
api = Proxy

app :: Application
app = serve api server

runApp :: IO ()
runApp = do
    mPort <- getEnv "PORT"
    run (read $ fromMaybe "3000" mPort) app
