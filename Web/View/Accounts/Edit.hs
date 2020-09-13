module Web.View.Accounts.Edit where
import Web.View.Prelude

data EditView = EditView { account :: Account }

instance View EditView ViewContext where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={AccountsAction}>Accounts</a></li>
                <li class="breadcrumb-item active">Edit Account</li>
            </ol>
        </nav>
        <h1>Edit Account</h1>
        {renderForm account}
    |]

renderForm :: Account -> Html
renderForm account = formFor account [hsx|
    {textField #email}
    {textField #passcode}
    {submitButton}
|]
