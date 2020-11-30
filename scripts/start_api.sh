#!/bin/bash

bundle install

rails db:migrate

rails server -p 3000 -b '0.0.0.0'