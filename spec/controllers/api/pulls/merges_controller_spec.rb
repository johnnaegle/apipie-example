require 'rails_helper'

RSpec.describe Api::Pulls::MergesController, type: :controller do
  it "merge PR", :show_in_doc => true, :doc_title => "Merge a pull request" do
    post 'create', :params => {:pull_id => 5}, :as => :json
    expect(response).to be_success
  end

  it "list merges", :show_in_doc => true, :doc_title => "List Merges" do
    get 'index', :params => {:pull_id => 5}, :as => :json
    expect(response).to be_success
  end
end
