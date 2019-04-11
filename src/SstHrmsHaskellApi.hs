{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module SstHrmsHaskellApi
    ( runApi
    )
where

import Api.HealthCheck (HealthCheckApi, healthCheckHandler)
import Network.Wai
import Network.Wai.Handler.Warp
import Servant

type API = HealthCheckApi

server :: Server API
server = healthCheckHandler

api :: Proxy API
api = Proxy

app :: Application
app = serve api server

runApi :: IO ()
runApi = run 8000 app
