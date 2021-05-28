#!/bin/bash
nodemon -w webpack.config.js -x "npx webpack build --progress --env $1 --color -w"

