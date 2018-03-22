#!/bin/bash

DIRECTORY="frontend-upskilling-pr";
SHORT_HEAD=${TRAVIS_PULL_REQUEST_SHA:0:7};

git clone git@github.com:dgrochowski/dgrochowski.github.io.git deploy
cd deploy
git checkout master

if [ ! -d "$DIRECTORY" ]; then
  mkdir $DIRECTORY
fi
cd $DIRECTORY

if [ -d "$SHORT_HEAD" ]; then
  rm -rf $SHORT_HEAD
fi
mkdir $SHORT_HEAD

cp -r ../../docs/* $SHORT_HEAD/.
cd ..

git add *
git reset HEAD~1 --soft
git commit -m "Frontend upskill pages"
git push origin master -f

body="{\"body\": \":bell: $SHORT_HEAD changes available **[here](https://dgrochowski.github.io/frontend-upskilling-pr/$SHORT_HEAD/)** (Added automatically by Travis CI)\"}";
curl -s -X POST \
  -d "$body" \
  https://api.github.com/repos/dgrochowski/frontend-upskilling/issues/$TRAVIS_PULL_REQUEST/comments?access_token=$access_token
