#!/bin/bash
quasar build

cd dist/spa

git init
git remote add origin https://github.com/MuhammadjonBb/v-.git
git branch -M gh-pages
git add .
git commit -m "deploy"
git push -f origin gh-pages
