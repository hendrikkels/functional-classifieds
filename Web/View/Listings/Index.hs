module Web.View.Listings.Index where
import Web.View.Prelude

data IndexView = IndexView { listings :: [Listing] }

instance View IndexView ViewContext where
    html IndexView { .. } = do
       case currentUserOrNothing of 
            -- logged In
            Just currentUser -> [hsx|
            <div class="row">
                <div class="col">
                    <h1>Listings</h1>

                </div>
            </div>
            <hr/>
            <div class="card-columns">
                {forM_ listings renderListingP}
            </div>
            |]
            -- Not Logged in
            Nothing -> [hsx|
            <div class="row">
                <div class="col">
                    <h1>Listings</h1>
                </div>
            </div>
            <hr/>
            <div class="card-columns">
                {forM_ listings renderListingP}
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
