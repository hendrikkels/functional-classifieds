module Web.View.Sessions.Home where
import Web.View.Prelude

data HomeView = HomeView {posts :: [Post]}

instance View HomeView ViewContext where
    html HomeView { .. } = [hsx|
        <h1>Listings</h1>
        <div class="card-columns">
            {forM_ posts renderPost}
        </div>
    |]


renderPost post = [hsx|
    <div class="card">
        <img src="https://www.amityinternational.com/wp-content/uploads/2019/02/product-placeholder.jpg" class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title">{get #title post}</h5>
            <p class="card-text">{get #body post}</p>
        </div>
        <div class="card-footer">
            <a href={ShowPostAction (get #id post)} class="text-muted card-link">Show</a>
            <a href={EditPostAction (get #id post)} class="text-muted card-link">Edit</a>
            <a href={DeletePostAction (get #id post)} class="js-delete text-muted card-link">Delete</a>
            <small class="text-muted float-right">{get #createdAt post |> timeAgo}</small>
        </div>
    </div>
|]