module Web.View.Sessions.Home where
import Web.View.Prelude
import qualified Text.MMark as MMark

data HomeView = HomeView {listings :: [Listing]}

instance View HomeView ViewContext where
    html HomeView { .. } = [hsx|
            <div class="row">
                <div class="col">
                    <h1>Listings</h1>
                </div>
            </div>
            <hr/>
            <div class="card-columns">
                {forM_ listings renderListing   }
            </div>
            |]


renderListing listing = 
    [hsx|
    <div class="card">
        <img src="https://www.amityinternational.com/wp-content/uploads/2019/02/product-placeholder.jpg" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">{get #title listing}</h5>
            <h6 class="card-subtitle mb-2 text-muted">R{get #price listing}</h6>
            <p class="card-text">{get #description listing |> renderMarkdown}</p>
        </div>
        <div class="card-footer">
            <a href={ShowListingAction (get #id listing)} class="text-muted card-link">Show</a>
            <small class="text-muted float-right">{get #createdAt listing |> timeAgo}</small>
        </div>
    </div>
|]


renderMarkdown text =
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml