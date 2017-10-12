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
