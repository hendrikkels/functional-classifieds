module Web.View.Classifieds.Show where
import Web.View.Prelude

data ShowView = ShowView { classified :: Classified }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClassifiedsAction}>Classifieds</a></li>
                <li class="breadcrumb-item active">Show Classified</li>
            </ol>
        </nav>
        <h1>Show Classified</h1>
    |]
