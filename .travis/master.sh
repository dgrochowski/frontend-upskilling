#!/bin/bash

SHORT_MASTER=${TRAVIS_COMMIT:0:7};
TEMP_DIR="temp_pr_dir";
PR_DIR="up-pr"

if [ -d "../$TEMP_DIR" ]; then
  rm -rf ../$TEMP_DIR
fi
mkdir ../$TEMP_DIR

IFS=$'\n'   # set only new line as a field separator
for commit in $(git ls-remote --heads)
do
    SHORT_COMMIT=${commit:0:7};

    if [ $SHORT_COMMIT != $SHORT_MASTER ]; then
      git checkout $SHORT_COMMIT
      mkdir ../$TEMP_DIR/$SHORT_COMMIT
      cp -r docs/* ../$TEMP_DIR/$SHORT_COMMIT/.
      git checkout master
    fi
done

git clone git@github.com:dgrochowski/frontend-upskilling-pr.git $PR_DIR
cd $PR_DIR
git checkout master

cp index.html ../../$TEMP_DIR/index.html

cd ..
rm -rf $PR_DIR/*
cd $PR_DIR

cp -r ../../$TEMP_DIR/* .
rm -rf ../../$TEMP_DIR

git add *
git reset HEAD~1 --soft
git commit -m "Frontend upskill pages"
git push origin master -f
