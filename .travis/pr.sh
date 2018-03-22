#!/bin/bash

SHORT_HEAD=${TRAVIS_PULL_REQUEST_SHA:0:7};
PR_DIR="up-pr"

mkdir saved_files

git clone git@github.com:dgrochowski/frontend-upskilling-pr.git $PR_DIR
cd $PR_DIR
git checkout master

if [ -d "$SHORT_HEAD" ]; then
  rm -rf $SHORT_HEAD
fi
mkdir $SHORT_HEAD

cp -r ../docs/* $SHORT_HEAD/.

git add *
git reset HEAD~1 --soft
git commit -m "Frontend upskilling PR"
git push origin master -f

body="{\"body\": \":bell: $SHORT_HEAD changes available **[here](https://dgrochowski.github.io/frontend-upskilling-pr/$SHORT_HEAD/)** (Added automatically by Travis CI)\"}";
curl -s -X POST \
  -d "$body" \
  https://api.github.com/repos/dgrochowski/frontend-upskilling/issues/$TRAVIS_PULL_REQUEST/comments?access_token=$access_token
