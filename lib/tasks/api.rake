namespace :apidocs do
  desc "Generate examples by running specs marked for API documentation"
  task :record_examples => :environment do |t|
    ENV['APIPIE_RECORD'] = 'examples'
    Rake::Task['spec:controllers'].invoke
  end

  desc "Generate static documentation and examples"
  task :regenerate => [:environment, :record_examples, :generate] do |t|
  end

  desc "Generate static documentation"
  task :generate => :environment do |t|
    ENV['OUT'] = "#{Rails.root}/public/docs/api"
    Rake::Task['apipie:static'].invoke
    Rake::Task['apipie:static_json'].invoke
  end
end
