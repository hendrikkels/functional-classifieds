module Web.View.Listings.Edit where
import Web.View.Prelude

data EditView = EditView { listing :: Listing }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active">Edit Listing</li>
            </ol>
        </nav>
        <h1>Edit Listing</h1>
        {renderForm listing}
    |]

renderForm :: Listing -> Html
renderForm listing = formFor listing [hsx|
    {hiddenField #userId}
    {textField #title}
    {textareaField #description}
    {(textField #price)}
    {submitButton}
|]
