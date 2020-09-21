module Web.View.Sessions.Home where
import Web.View.Prelude

data HomeView = HomeView {posts :: [Post]}

instance View HomeView ViewContext where
    html HomeView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item" ><a href={NewSessionAction}>Login</a></li>
                <li class="breadcrumb-item"><a href={NewUserAction}>Register</a></li>
            </ol>
        </nav>
        <h1>Home</h1>
        <table class="table table-responsive">
            <thead>
                <tr>
                    <th>Posts</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>{forM_ posts renderPost}</tbody>
        </table>
    |]


renderPost post = [hsx|
    <tr>
        <td><h3>{get #title post}</h3></td>
        <td colspan = "3" >{get #createdAt post |> timeAgo} </td>

    </tr>
    <tr>
        <td>{get #body post}</td>
    </tr>
    <tr>
        <td></td>
        <td><a href={ShowPostAction (get #id post)}>Show</a></td>
        <td><a href={EditPostAction (get #id post)} class="text-muted">edit</a></td>
        <td><a href={DeletePostAction (get #id post)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]