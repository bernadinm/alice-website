# Alice's Website

[![CircleCI](https://circleci.com/gh/bernadinm/alice-website.svg?style=svg)](https://circleci.com/gh/bernadinm/alice-website)

# Instructions to Redeploy Site

This site has an automated build process. In order for the site to be reployed by any code change, Alice must simply pull from her latest git commits, make a change, and push the new changes. Everything else will be managed, tested, and deployed via CircleCi.

## How to pull latest change

Alice must run command locally to pull from her github account

```bash
$ git clone git@github.com:bernadinm/alice-website.git
```

## How to make a change to the website

When Alice needs to make a change to the website, she can simply modify her index.html file locally. Here is an example below:

```bash
$ echo "<p>My field trip 06-17-2018</p>" >> index.html
```

## How to publish new changes to the website

When Alice is content with her changes, she may commit them back to her repository where it will be placed in her CI/CD pipeline.

```bash
$ git add index.html
$ git commit -m "added field trip information"
$ git push origin master
```

At this point, the website will be pushed into the CICD pipeline, tested by an HTML validator, and if returns successfully, it will be deployed on the web.

# Changing Webservers

## from python3 HTTP Server to NGINX

Currently the default website being used is the python3 HTTP webserver. If Alice would like to change this to NGINX, she may simply change the server_deploy.sh file locally. 


###### Python3 Webserver
```bash
#!/bin/sh

git clone git@github.com:bernadinm/alice-website.git
docker run -d -v $PWD/alice-website/src:/var/www:ro -p 8000:8080 trinitronx/python-simplehttpserver
```

###### NGINX Webserver
```bash
#!/bin/sh

git clone git@github.com:bernadinm/alice-website.git
docker run -d -v $PWD/alice-website/src:/usr/share/nginx/html:ro -p 8000:80 nginx
```
