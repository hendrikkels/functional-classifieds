module Web.View.Users.Show where
import Web.View.Prelude

data ShowView = ShowView { user :: Include "listings" User }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={UsersAction}>Users</a></li>
                <li class="breadcrumb-item active">Show User</li>
            </ol>
        </nav>
        <h1>Show User</h1>
        <a href={NewListingAction (get #id user)}>Add Listing</a>
        <hr/>
        <div class="card-columns">
            {forEach (get #listings user) renderListing}
        </div>
    |]


renderListing listing = 
    [hsx|
    <div class="card">
        <img src="https://www.amityinternational.com/wp-content/uploads/2019/02/product-placeholder.jpg" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">{get #title listing}</h5>
            <p class="card-text">{get #description listing}</p>
        </div>
        <div class="card-footer">
            <a href={ShowListingAction (get #id listing)} class="text-muted card-link">Show</a>
            <a href={EditListingAction (get #id listing)} class="text-muted card-link">Edit</a>
            <a href={DeleteListingAction (get #id listing)} class="js-delete text-muted card-link">Delete</a>
            <small class="text-muted float-right">{get #createdAt listing |> timeAgo}</small>
        </div>
    </div>
|]