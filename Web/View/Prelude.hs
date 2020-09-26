module Web.View.Prelude
( module IHP.ViewPrelude
, module Web.View.Layout
, module Generated.Types
, module Web.Types
, module Web.View.Context
, module Application.Helper.View
, renderListingP
) where

import IHP.ViewPrelude
import Web.View.Layout
import Generated.Types
import Web.Types
import Web.Routes ()
import Web.View.Context
import Application.Helper.View

renderListingP :: Listing -> Html
renderListingP listing = 
    case currentUserOrNothing of 
            -- logged In
            Just currentUser -> [hsx|
            <div class="card">
                <img src="https://www.amityinternational.com/wp-content/uploads/2019/02/product-placeholder.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">{get #title listing}</h5>
                    <p class="card-text">{get #description listing}</p>
                </div>
                <div class="card-footer">
                    <a href={ShowListingAction (get #id listing)} class="text-muted card-link">Show</a>
                    <a href={EditListingAction (get #id listing)} class="text-muted card-link">Edit</a>
                    <a href={DeleteListingAction (get #id listing)} class="js-delete text-muted card-link">Delete</a>
                    <small class="text-muted float-right">{get #createdAt listing |> timeAgo}</small>
                </div>
            </div>
            |]
            -- Not Logged in
            Nothing -> [hsx|
            <div class="card">
                <img src="https://www.amityinternational.com/wp-content/uploads/2019/02/product-placeholder.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">{get #title listing}</h5>
                    <p class="card-text">{get #description listing}</p>
                </div>
                <div class="card-footer">
                    <a href={ShowListingAction (get #id listing)} class="text-muted card-link">Show</a>
                    <small class="text-muted float-right">{get #createdAt listing |> timeAgo}</small>
                </div>
            </div>
            |]