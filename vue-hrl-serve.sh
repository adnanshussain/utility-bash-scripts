#!/bin/bash
nodemon -w vue.config.js -w package.json -x "npx vue-cli-service serve --port 8080"
