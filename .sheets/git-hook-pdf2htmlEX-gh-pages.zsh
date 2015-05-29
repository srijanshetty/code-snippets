#!/usr/bin/env bash

set -e

branch=$(git rev-parse --abbrev-ref HEAD)

if [[ $branch == "master" ]]; then
    xelatex cv
    git checkout gh-pages
    pdf2htmlEX --process-outline 0 --zoom 1.6 cv.pdf
    mv cv.html index.html
    git add index.html
    git commit -m "Update to Website"
    git push origin gh-pages
    git checkout master
fi
