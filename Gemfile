source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

gem 'active_model_serializers', '~> 0.10.0'
gem 'acts_as_list'
gem 'apitome', github: 'jejacks0n/apitome', branch: 'master'
gem 'decent_exposure', github: 'hashrocket/decent_exposure', branch: 'master'
gem 'pg', '~> 0.18'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.1.1'
gem 'rspec_api_documentation'

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner-active_record'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
