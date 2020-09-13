module Web.View.Accounts.New where
import Web.View.Prelude

data NewView = NewView { account :: Account }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={AccountsAction}>Accounts</a></li>
                <li class="breadcrumb-item active">New Account</li>
            </ol>
        </nav>
        <h1>New Account</h1>
        {renderForm account}
    |]

renderForm :: Account -> Html
renderForm account = formFor account [hsx|
    {textField #email}
    {textField #passcode}
    {submitButton}
|]
