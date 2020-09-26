module Web.View.Users.Show where
import Web.View.Prelude

data ShowView = ShowView { user :: Include "listings" User }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <h1>Listings for {get #email user}</h1>
        <a href={NewListingAction (get #id user)}>Add Listing</a>
        <hr/>
        <div class="card-columns">
            {forEach (get #listings user) renderListingP}
        </div>
    |]