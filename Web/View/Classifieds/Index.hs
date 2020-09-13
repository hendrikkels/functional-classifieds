module Web.View.Classifieds.Index where
import Web.View.Prelude

data IndexView = IndexView { classifieds :: [Classified] }

instance View IndexView ViewContext where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ClassifiedsAction}>Classifieds</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewClassifiedAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Classified</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach classifieds renderClassified}</tbody>
            </table>
        </div>
    |]


renderClassified classified = [hsx|
    <tr>
        <td>{classified}</td>
        <td><a href={ShowClassifiedAction (get #id classified)}>Show</a></td>
        <td><a href={EditClassifiedAction (get #id classified)} class="text-muted">Edit</a></td>
        <td><a href={DeleteClassifiedAction (get #id classified)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
