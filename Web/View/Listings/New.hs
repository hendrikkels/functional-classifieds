module Web.View.Listings.New where
import Web.View.Prelude

data NewView = NewView 
    { listing :: Listing
    }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <h1>New Listing</h1>
        {renderForm listing}
    |]

renderForm :: Listing -> Html
renderForm listing = formFor listing [hsx|
    {textField #userId}
    {textField #title}
    {textField #description}
    {textField #price}
    {textField #createdAt}
    {submitButton}
|]
