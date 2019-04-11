{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Main (main) where

import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import SstHrmsHaskellApi (someFunc)

type HealthCheckApi = "health-check" :> Get '[JSON] String

server :: Server HealthCheckApi
server = return "ok"

healthCheckApi :: Proxy HealthCheckApi
healthCheckApi = Proxy

app :: Application
app = serve healthCheckApi server

main :: IO ()
main = run 8080 app
