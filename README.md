# README
Demonstrates an issue with the API documentation [gem apipie-rails](https://github.com/Apipie/apipie-rails)

This project has two controllers that are related, each with a POST /create action,
one with a GET /index action and one with a PUT /destroy action.  The controllers
use the same resource_id, which groups them together, but the generated documentation
does not include all the methods.

The ideal grouping looks more like github's API documentation. The github API
groups many different endpoints together under one resource, such as pull requests.
The github API includes these (and more) endpoints under pull requests:

- `GET /repos/:owner/:repo/pulls`,
- `PUT /repos/:owner/:repo/pulls/:number/merge` ,
- `PATCH /repos/:owner/:repo/pulls/:number`

The routes in this project are:

```
       api_pull_merges GET    /api/pulls/:pull_id/merges(.:format)                 api/pulls/merges#index
                       POST   /api/pulls/:pull_id/merges(.:format)                 api/pulls/merges#create
             api_pulls POST   /api/pulls(.:format)                                 api/pulls#create
              api_pull DELETE /api/pulls/:id(.:format)                             api/pulls#destroy
```

When the docs are generated (`rake apidocs:regenerate`), only 3 of these appear
in the generated api docs:

-  `GET    /api/pulls/:pull_id/merges`
-  `POST   /api/pulls`
-  `DELETE /api/pulls/:pull_id`

The second post request is missing:

-  `POST    /api/pulls/:pull_id/merges`

The controllers:

```ruby
class Api::PullsController < ApplicationController
  wrap_parameters false

  resource_description do
    name "Pull Requests"
    resource_id "Pull Requests"
    short "Manage pull requests"
  end

  api :POST, '/api/pulls', "Create a new pull request"
  def create
    head :ok
  end

  api :DELETE, '/api/pulls/:id', "Deletes a pull request"
  param :id, Integer, :required => true, :desc => "Which PR to nuke"
  def destroy
    head :ok
  end
end

```


```ruby
class Api::Pulls::MergesController < ApplicationController
  wrap_parameters false

  resource_description do
    resource_id "Pull Requests"
  end

  api :GET, "/api/pulls/:pull_id/merges", "List merges for a PR"
  param :pull_id, Integer, :required => true
  def index
  end

  api :POST, "/api/pulls/:pull_id/merges", "Merge a pull request"
  param :pull_id, Integer, :required => true
  def create
    head :ok
  end

end

```

