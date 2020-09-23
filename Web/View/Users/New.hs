module Web.View.Users.New where
import Web.View.Prelude

data NewView = NewView { user :: User }

instance View NewView ViewContext where
    html NewView { .. } = [hsx|
        <h1>New User</h1>
        {renderForm user}
    |]

renderForm :: User -> Html
renderForm user = formFor user [hsx|
    {textField #email}
    {textField #passwordHash}
    {submitButton}
|]
