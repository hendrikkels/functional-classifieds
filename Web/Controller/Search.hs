module Web.Controller.Search where

import Web.Controller.Prelude
import Web.View.Sessions.Home

instance Controller SearchController where
    action NewSearchAction { searchText } = do
        listings <- sqlQuery "SELECT * FROM listings WHERE UPPER(title) LIKE UPPER(?)" [x]
        setSuccessMessage ("Search results for: " ++ searchText)
        render HomeView { .. }
            where x = "%" ++ searchText ++ "%"