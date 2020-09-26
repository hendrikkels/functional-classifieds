module Web.View.Layout (defaultLayout, Html) where

import IHP.ViewPrelude
import IHP.Environment
import qualified Text.Blaze.Html5            as H
import qualified Text.Blaze.Html5.Attributes as A
import Web.Types
import Web.Routes
import qualified IHP.FrameworkConfig as FrameworkConfig
import Config ()
import Web.Types
import Generated.Types
import Application.Helper.View
type Html = HtmlWithContext ViewContext

defaultLayout :: Html -> Html
defaultLayout inner = H.docTypeHtml ! A.lang "en" $ [hsx|
<head>
    {metaTags}

    <link rel="stylesheet" href="/vendor/bootstrap.min.css"/>
    <link rel="stylesheet" href="/app.css"/>

    {scripts}

    <title>App</title>
</head>
<body>
    {navbar}
    <div class="container mt-4">
        {renderFlashMessages}
        {inner}
    </div>
</body>
|]


navbar :: Html
navbar = [hsx|
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
  <a class="navbar-brand" href="/">Functional Marketplace</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      {sessionButtons}
    </ul>
   <li><form method="GET" id="searchForm" action="/NewSearch" class="form-inline my-2 my-lg-0">
      <input name="searchText" id="searchText" class="form-control mr-sm-2" type="text" value="" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" onclick="document.getElementById('searchForm').submit()">Search</button>
    </form></li>
  </div>
  </div>
</nav>
|]
        
sessionButtons :: Html
sessionButtons = case (get #user viewContext) of
    Just user -> [hsx|
      <li class="nav-item">
        <a class="nav-link" href={ShowUserAction (get #id user )}>My Listings</a>
      </li>
      <li class="nav-item">
        <a class="js-delete js-delete-no-confirm nav-link" href={DeleteSessionAction}>Logout</a>
      </li>|]
    Nothing -> [hsx| 
      <li class="nav-item">
        <a class="nav-link" href={NewUserAction}>Register</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href={NewSessionAction}>Login</a>
      </li>|]

-- <script src="/helpers.js"></script>
scripts = do
    when (isDevelopment FrameworkConfig.environment) [hsx|<script id="livereload-script" src="/livereload.js"></script>|]
    [hsx|
        <script src="/vendor/morphdom-umd.min.js"></script>
        <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
        <script src="/vendor/timeago.js"></script>
        <script src="/vendor/popper.min.js"></script>
        <script src="/vendor/bootstrap.min.js"></script>
        <script src="/helpers.js"></script>
    |]
    when (isProduction FrameworkConfig.environment) [hsx|
            <script src="/vendor/turbolinks.js"></script>
            <script src="/vendor/morphdom-umd.min.js"></script>
            <script src="/vendor/turbolinksMorphdom.js"></script>
            <script src="/vendor/turbolinksInstantClick.js"></script>
        |]


metaTags = [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="App"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="TODO"/>
    <meta property="og:description" content="TODO"/>
|]
