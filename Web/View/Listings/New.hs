module Web.View.Listings.New where
import Web.View.Prelude

data NewView = NewView 
    { listing :: Listing  
    , user :: User 
    }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ListingsAction}>Listings</a></li>
                <li class="breadcrumb-item active">New Listing</li>
            </ol>
        </nav>
        <h1>New Listing</h1>
        {renderForm listing}
    |]

renderForm :: Listing -> Html
renderForm listing = formFor listing [hsx|
    {hiddenField #userId}
    {textField #title}
    {textField #description}
    {textField #price}
    {submitButton}
|]
