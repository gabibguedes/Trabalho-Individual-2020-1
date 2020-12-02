#!/bin/bash

bundle install

export RAILS_ENV=test 

rake db:create 
rake db:migrate

rake test
