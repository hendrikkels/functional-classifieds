module Web.View.Accounts.Show where
import Web.View.Prelude

data ShowView = ShowView { account :: Account }

instance View ShowView ViewContext where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={AccountsAction}>Accounts</a></li>
                <li class="breadcrumb-item active">Show Account</li>
            </ol>
        </nav>
        <h1>{get #email account}</h1>
        <div>Password: {get #passcode account}</div>
    |]
