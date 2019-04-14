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

instance ToJSON HealthCheckMessage

type HealthCheckApi = "health-check" :> Get '[JSON] HealthCheckMessage

healthCheckHandler :: Handler HealthCheckMessage
healthCheckHandler = return $ HealthCheckMessage "Ok"
