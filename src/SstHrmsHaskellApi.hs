{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module SstHrmsHaskellApi
       ( runApi
       ) where

import Network.Wai
import Network.Wai.Handler.Warp
import Servant

type HealthCheckApi = "health-check" :> Get '[JSON] String

server :: Server HealthCheckApi
server = return "ok"

healthCheckApi :: Proxy HealthCheckApi
healthCheckApi = Proxy

app :: Application
app = serve healthCheckApi server

runApi :: IO ()
runApi = run 8000 app
