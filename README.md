## Iceylog
Iceylog is a blog system~



## Install


### Ruby 1.9.3
=
+ rvm list
+ rvm use ruby-1.9.3-rc1
+ bundle  install

### MongoDB
+ ./bin/mongod  --dbpath /datas/dbs/monogdb/   --fork -logpath /var/log/mongodb.log

### git
+ git clone git://github.com/IceskYsl/Iceylog.git online_20120624
+ ln -s ./online_20120624  current
+ cd current
+ RAILS_ENV=production rake -T
+ RAILS_ENV=production rake db:seed
+ bundle exec rake assets:precompile 
+ bundle exec unicorn  -E production -D
=>http://host:8080/





