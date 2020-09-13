module Web.View.Classifieds.New where
import Web.View.Prelude

data NewView = NewView { classified :: Classified }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClassifiedsAction}>Classifieds</a></li>
                <li class="breadcrumb-item active">New Classified</li>
            </ol>
        </nav>
        <h1>New Classified</h1>
        {renderForm classified}
    |]

renderForm :: Classified -> Html
renderForm classified = formFor classified [hsx|
    {textField #title}
    {textField #description}
    {textField #price}
    {textField #accountId}
    {submitButton}
|]
