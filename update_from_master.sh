#!/bin/bash          
git pull
grunt build
sudo NODE_ENV=prod node build/app.js