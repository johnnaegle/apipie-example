Apipie.configure do |config|
  config.app_name                = "Example"
  config.api_base_url            = nil

  config.doc_base_url            = "/api/docs"

  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.namespaced_resources    = true

  config.show_all_examples       = true
  config.validate                = false

  config.use_cache               = !['test', 'development'].include?(Rails.env)

  config.markup                  = Apipie::Markup::Markdown.new
end
