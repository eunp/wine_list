# README

## Synopsis

This application keeps track of your wine list. It does so by linking them to stores and their locations within the store. For example you may have a wine fridge store containing N number of locations. Each one of these locations can be associated with a wine to show where they are stored.

## Installation

[Versions Used]

Ruby 2.3.3p222

Rails 5.0.1

Gem 2.5.2

SQLite 3.8.10.2

First download top level directory 'wine_list'. The run [gem install bundler]. Next run [bundle install]. The application directory is now set up and you can run the following:

[Running test]

bin/rails test

[Setup assets]

RAILS_ENV=production bin/rails assets:precompile

[Reset DB]

RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bin/rails db:reset

[Running application]

RAILS_ENV=production SECRET_KEY_BASE=\`bin/rake secret\` bin/rails server

## License

Copyright (c) 2017 Philip Eun

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
