#!/bin/bash
nodemon --watch "src/**" --ext "ts,json" --ignore "src/**/*.spec.ts" --exec "(tsc src/index.ts $1 $2 || exit 1) && node src/index.js"





