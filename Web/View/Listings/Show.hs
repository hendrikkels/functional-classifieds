module Web.View.Listings.Show where
import Web.View.Prelude
import qualified Text.MMark as MMark

data ShowView = ShowView { listing :: Listing
                         , user :: User }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <div class="card">
            <img src="https://www.amityinternational.com/wp-content/uploads/2019/02/product-placeholder.jpg" class="card-img-top" alt="...">
            <div class="card-body">
                <div class="row no-gutters">
                    <div class="col-sm-12 col-md-8">
                        <h5 class="card-title">{get #title listing}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">R{get #price listing}</h6>
                        <div class="card-text">
                            {get #description listing |> renderMarkdown}
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-4">
                        <h5 class="card-title text-muted">Contact</h5>
                        <div class="card-text">
                            Email: <br/>
                            {get #email user }
                        </div>
                    </div>
                </div>
            </div>
        </div>
    |]

renderMarkdown text =
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml