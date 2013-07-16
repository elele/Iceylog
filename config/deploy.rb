require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
# require 'mina/rbenv'  # for rbenv support. (http://rbenv.org)
require 'mina/rvm'    # for rvm support. (http://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, 'root@vps'
set :deploy_to, '/var/www/elele.me'
set :repository, 'git://github.com/elele/Iceylog.git'
set :branch, 'master'
set :rvm_path, "/usr/local/rvm/scripts/rvm"
# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/mongo.yml', 'log']

# Optional settings:
#   set :user, 'foobar'    # Username in the server to SSH to.
#   set :port, '30000'     # SSH port number.
# set :user , 'root'
# set :port , '22'
set :identity_file,"/Users/9jsc/.ssh/id_rsa"
# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
	# If you're using rbenv, use this to load the rbenv environment.
	# Be sure to commit your .rbenv-version to your repository.
	# invoke :'rbenv:load'

	# For those using RVM, use this to load an RVM version@gemset.
	invoke :'rvm:use[ruby-1.9.3-p448@default]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
	queue! %[mkdir -p "#{deploy_to}/shared/log"]
	queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

	queue! %[mkdir -p "#{deploy_to}/shared/config"]
	queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

	queue! %[touch "#{deploy_to}/shared/config/mongo.yml"]
	queue  %[echo "-----> Be sure to edit 'shared/config/mongo.yml'."]
	# queue  %[source]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
	deploy do
		# Put things that will set up an empty directory into a fully set-up
		# instance of your project.
		invoke :'git:clone'
		invoke :'deploy:link_shared_paths'
		queue 'echo "path=$PATH"'
		invoke :'bundle:install'
		# invoke :'rails:db_migrate'
		# invoke :'rails:assets_precompile'
		invoke :'unicorn_restart'

		to :launch do
			

		end
	end
end

desc "unicorn"
task :unicorn_start => :environment do
	queue "cd #{deploy_to}/#{current_path} && unicorn_rails -c #{deploy_to}/#{current_path}/config/unicorn.rb -E production -D"	
end
task :unicorn_restart	do
	queue "kill -USR2 `cat #{deploy_to}/#{current_path}/tmp/pids/unicorn.pid`"
end
task :unicorn_stop do
	queue "kill -QUIT `cat #{deploy_to}/#{current_path}/tmp/pids/unicorn.pid`"
end 

desc "nginx"
task :nginx_start  do
	queue '/etc/init.d/nginx start'
end
task	:nginx_restart do
	queue '/etc/init.d/nginx restart'
end
task :nginx_stop do
	queue '/etc/init.d/nginx stop'
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

