module Web.Controller.Sessions where

import Web.Controller.Prelude
import Web.View.Sessions.New
import qualified IHP.AuthSupport.Controller.Sessions as Sessions
import Web.View.Sessions.Home

instance Controller SessionsController where
    action HomeAction = do
        listings <- query @Listing
            |> orderByDesc #createdAt
            |> fetch
        render HomeView { .. }

    action NewSessionAction = Sessions.newSessionAction @User

    action ShowSessionAction = do 
        renderPlain "This"

    action CreateSessionAction = Sessions.createSessionAction @User

    action DeleteSessionAction = Sessions.deleteSessionAction @User
         


instance Sessions.SessionsControllerConfig User where
