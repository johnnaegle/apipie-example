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
