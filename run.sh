#!/bin/sh

docker build -t gggeek/secure_spreadsheet_issue:v1 .

docker run --rm -it -v "$(pwd):/var/www" gggeek/secure_spreadsheet_issue:v1 /var/www/test.sh
