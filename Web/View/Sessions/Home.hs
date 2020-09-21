module Web.View.Sessions.Home where
import Web.View.Prelude

data HomeView = HomeView

instance View HomeView ViewContext where
    html HomeView = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={NewSessionAction}>Login</a></li>
                <li class="breadcrumb-item active">HomeView</li>
            </ol>
        </nav>
        <h1>HomeView</h1>
    |]
