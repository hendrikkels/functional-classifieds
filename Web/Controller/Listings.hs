module Web.Controller.Listings where
import Web.Controller.Prelude
import Web.View.Listings.Index
import Web.View.Listings.New
import Web.View.Listings.Edit
import Web.View.Listings.Show

import Database.PostgreSQL.Simple.Types

instance Controller ListingsController where

    action ListingsAction = do
        listings <- query @Listing 
            |> orderByDesc #createdAt
            |> fetch
        render IndexView { .. }

    action NewListingAction { userId } = do
        let listing = newRecord
                |> set #userId userId
        user <- fetch userId
        render NewView { .. }

    action ShowListingAction { listingId } = do
        listing <- fetch listingId
        render ShowView { .. }

    action EditListingAction { listingId } = do
        listing <- fetch listingId
        render EditView { .. }

    action UpdateListingAction { listingId } = do
        listing <- fetch listingId
        listing
            |> buildListing
            |> ifValid \case
                Left listing -> render EditView { .. }
                Right listing -> do
                    listing <- listing |> updateRecord
                    setSuccessMessage "Listing updated"
                    redirectTo EditListingAction { .. }

    action CreateListingAction = do
        let listing = newRecord @Listing
        listing
            |> buildListing
            |> ifValid \case
                Left listing -> do 
                    user <- fetch (get #userId listing)
                    render NewView { .. } 
                Right listing -> do
                    listing <- listing |> createRecord
                    setSuccessMessage "Listing created"
                    redirectTo HomeAction

    action DeleteListingAction { listingId } = do
        listing <- fetch listingId
        deleteRecord listing
        setSuccessMessage "Listing deleted"
        redirectTo ShowUserAction { userId = get #userId listing } 

buildListing listing = listing
    |> fill @["userId","title","description","price"]
