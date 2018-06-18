#!/bin/sh

git clone git@github.com:bernadinm/alice-website.git
docker run -d -v $PWD/alice-website:/var/www:ro -p 8000:8080 trinitronx/python-simplehttpserver
