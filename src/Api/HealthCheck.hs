{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Api.HealthCheck
    ( HealthCheckApi
    , healthCheckHandler
    )
where

import Servant

type HealthCheckApi = "health-check" :> Get '[JSON] String

healthCheckHandler :: Handler String
healthCheckHandler = return "ok"
