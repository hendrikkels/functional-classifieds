module Web.FrontController where
import IHP.RouterPrelude
import IHP.ControllerSupport
import Generated.Types
import Web.Types

-- Controller Imports
import Web.Controller.Search
import Web.Controller.Listings
import Web.Controller.Listings
import Web.Controller.Users
import Web.Controller.Comments
import Web.Controller.Posts
import IHP.Welcome.Controller

import IHP.LoginSupport.Middleware
import Web.Controller.Sessions

instance FrontController WebApplication where
    controllers = 
        [ startPage HomeAction
        , parseRoute @SessionsController
        -- Generator Marker
        , parseRoute @SearchController
        , parseRoute @ListingsController
        , parseRoute @UsersController
        , parseRoute @CommentsController
        , parseRoute @PostsController
        ]

instance InitControllerContext WebApplication where
    initContext =
        initAuthentication @User
