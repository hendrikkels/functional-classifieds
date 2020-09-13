module Web.View.Accounts.Index where
import Web.View.Prelude

data IndexView = IndexView { accounts :: [Account] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={AccountsAction}>Accounts</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewAccountAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Account</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach accounts renderAccount}</tbody>
            </table>
        </div>
    |]


renderAccount account = [hsx|
    <tr>
        <td>{account}</td>
        <td><a href={ShowAccountAction (get #id account)}>Show</a></td>
        <td><a href={EditAccountAction (get #id account)} class="text-muted">Edit</a></td>
        <td><a href={DeleteAccountAction (get #id account)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
