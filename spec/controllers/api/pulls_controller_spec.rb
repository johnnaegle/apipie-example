require 'rails_helper'

RSpec.describe Api::PullsController, type: :controller do

  it "create PR", :show_in_doc => true, :doc_title => "create a pull request" do
    post 'create', :params => {}, :as => :json
    expect(response).to be_success
  end

  it "delete PR", :show_in_doc => true, :doc_title => "delete a PR" do
    delete 'destroy', :params => {:id => 5}, :as => :json
    expect(response).to be_success
  end

end
