{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Api.HealthCheck
    ( HealthCheckApi
    , healthCheckHandler
    )
where

import Data.Aeson
import Servant

newtype HealthCheckMessage = HealthCheckMessage { status :: String }
    deriving (Eq, Show, Generic)

type HealthCheckApi = "health-check" :> Get '[JSON] HealthCheckMessage

instance ToJSON HealthCheckMessage

healthCheckHandler :: Handler HealthCheckMessage
healthCheckHandler = return $ HealthCheckMessage "Ok"
