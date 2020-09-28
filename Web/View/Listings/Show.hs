module Web.View.Listings.Show where
import Web.View.Prelude
import qualified Text.MMark as MMark

data ShowView = ShowView { listing :: Listing }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <div class="card">
            <img src="https://www.amityinternational.com/wp-content/uploads/2019/02/product-placeholder.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title text-muted">R{get #price listing}</h5>
                <div class="card-text">
                    {get #description listing |> renderMarkdown}
                </div>
            </div>
        </div>
    |]

renderMarkdown text =
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml