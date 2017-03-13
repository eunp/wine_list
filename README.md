# README

* Versions *
Ruby 2.3.3p222
Rails 5.0.1
SQLite 3.8.10.2

* Running test *
bin/rails test

* Setup assets *
RAILS_ENV=production bin/rails assets:precompile

* Reset DB *
RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bin/rails db:reset

* Running application *
RAILS_ENV=production SECRET_KEY_BASE=`bin/rake secret` bin/rails server


