#!/bin/bash
nodemon -w webpack.config.js -x "npx webpack serve --bonjour --env $1"
