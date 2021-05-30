#! /usr/bin/bash
echo =======================================
# read input
echo -n "Enter a anything: "
read NAME
echo "Anything is: " $NAME
echo =======================================
# execute command & save output in variable
PWD=$(pwd)
BASH_VERSION=`bash --version`
echo =======================================
echo $PWD
echo $BASH_VERSION
echo =======================================
# Multicommand line
echo $PWD; echo $BASH_VERSION
echo =======================================
# nodemon --watch "src/**" --ext "ts,json" --ignore "src/**/*.spec.ts" --exec "(tsc src/index.ts $1 $2 || exit 1) && node src/index.js"





