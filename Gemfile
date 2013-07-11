source 'http://ruby.taobao.org'

gem 'execjs'
# gem 'therubyracer'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'rails', '4.0.0'
gem "rails_autolink"#, ">= 1.0.4"

# Mongoid 辅助插件
# gem "mongoid", :git  => 'https://github.com/mongoid/mongoid.git'
# gem "bson_ext", "1.6.4"
# gem 'mongo-rails-instrumentation'#,'0.3.0'
# gem 'mongoid_auto_increment_id'#, "0.4.0"
# gem 'mongoid_rails_migrations'#, '1.0.1'

gem "mongoid", github: 'mongoid/mongoid', ref: '11e45e5a30a45458b83db99ab6c9d9ccc337e66f'
gem 'mongoid_auto_increment_id', "0.6.1"
gem 'mongoid_rails_migrations', '1.0.0'

# 分页
# 分页
gem 'will_paginate'#, '3.0.2'
gem 'will_paginate_mongoid'#, '~> 1.0.2'
# gem 'bootstrap-will_paginate', '0.0.3'

# Markdown 格式
gem "redcarpet", "~> 2.0.0"
gem 'hpricot', '~> 0.8.5'
gem "pygments.rb", '~> 0.2.4'

# YAML 配置信息
gem "settingslogic", "~> 2.0.6"
  
# 上传组件
gem 'carrierwave'#, '0.9.0'
gem 'carrierwave-mongoid'#, '0.6.1', :require => 'carrierwave/mongoid'
gem 'mini_magick','3.3'
#gem 'carrierwave-upyun', '0.1.3'


# 禁用 assets 日志
# gem 'quiet_assets', :git => 'git://github.com/AgilionApps/quiet_assets.git'



# 表单 last commit: 2011-12-03
gem 'simple_form', :git => "git://github.com/plataformatec/simple_form.git"
gem 'bootstrap-rails', :require => 'bootstrap-rails', :git => 'git://github.com/xdite/bootstrap-rails.git'
# gem 'anjlab-bootstrap-rails', '2.0.3.2', require: 'bootstrap-rails'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'#,   '~> 3.2.3'
  gem 'coffee-rails'#, '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

#table_builder
gem "watu_table_builder", :require => "table_builder"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'


group :development, :test do
	gem "mongoid_colored_logger", "0.2.2"
  gem "quiet_assets", "~> 1.0.2"
end
# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
