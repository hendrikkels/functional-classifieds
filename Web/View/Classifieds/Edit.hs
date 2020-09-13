module Web.View.Classifieds.Edit where
import Web.View.Prelude

data EditView = EditView { classified :: Classified }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ClassifiedsAction}>Classifieds</a></li>
                <li class="breadcrumb-item active">Edit Classified</li>
            </ol>
        </nav>
        <h1>Edit Classified</h1>
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
