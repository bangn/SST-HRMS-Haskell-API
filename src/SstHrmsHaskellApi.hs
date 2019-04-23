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

api :: Proxy API
api = Proxy

server :: Server API
server = healthCheckHandler

app :: Application
app = serve api server

runApp :: IO ()
runApp = do
    mPort <- getEnv "PORT"
    putStrLn $ "API starts on port: " ++ show (toPort mPort)
    run (toPort mPort) app
  where
    toPort :: Maybe String -> Port
    toPort = read . fromMaybe "8080"
