#!/bin/bash

if [[ $TRAVIS_BRANCH == 'master' ]]
  git clone git@github.com:dgrochowski/dgrochowski.github.io.git deploy
  cd deploy
  git checkout gh_pages
  rm -rf frontend
  mkdir frontend
  cp -r ../css ./frontend/css
  cp -r ../html5 ./frontend/html5
  cp -r ../dist ./frontend/dist
  cp -r ../node_modules ./frontend/node_modules
  cp -r ../sass ./frontend/sass
  cp -r ../webpack ./frontend/webpack
  cp -r ../templates ./frontend/templates
  git add *
  git reset HEAD~1 --soft
  git commit -m "Frontend upskill pages"
  git push origin gh_pages -f
fi
