#!/bin/bash

DIRECTORY="frontend-upskilling-pr";
SHORT_MASTER=${TRAVIS_COMMIT:0:7};
TEMP_DIR="temp_pr_dir";

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

git clone git@github.com:dgrochowski/dgrochowski.github.io.git deploy
cd deploy
git checkout master

if [ -d "$DIRECTORY" ]; then
  rm -rf $DIRECTORY
fi
mkdir $DIRECTORY

cp -r ../../$TEMP_DIR/* $DIRECTORY/.
rm -rf ../../$TEMP_DIR

git add *
git reset HEAD~1 --soft
git commit -m "Frontend upskill pages"
git push origin master -f
