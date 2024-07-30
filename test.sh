#!/bin/sh

cd /var/www/
composer install
php ./test.php
