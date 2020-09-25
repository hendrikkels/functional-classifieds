module Web.View.Listings.Index where
import Web.View.Prelude

data IndexView = IndexView { listings :: [Listing] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ListingsAction}>Listings</a></li>
            </ol>
        </nav>
        <h1>Listings</h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Listing</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach listings renderListing}</tbody>
            </table>
        </div>
    |]


renderListing listing = [hsx|
    <tr>
        <td>{listing}</td>
        <td><a href={ShowListingAction (get #id listing)}>Show</a></td>
        <td><a href={EditListingAction (get #id listing)} class="text-muted">Edit</a></td>
        <td><a href={DeleteListingAction (get #id listing)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
