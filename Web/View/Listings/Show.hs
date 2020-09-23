module Web.View.Listings.Show where
import Web.View.Prelude

data ShowView = ShowView { listing :: Listing }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ListingsAction}>Listings</a></li>
                <li class="breadcrumb-item active">Show Listing</li>
            </ol>
        </nav>
        <h1>Show Listing</h1>
    |]
