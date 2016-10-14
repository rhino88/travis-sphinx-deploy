#!/bin/bash

set -e -u

sudo apt-get -qq update
apt-get install python-sphinx

if [[ "$TRAVIS_REPO_SLUG" == "perfectsense/"* ]] && \
   [ "$TRAVIS_PULL_REQUEST" == "false" ]; then

  if [[ "$TRAVIS_BRANCH" == "release/"* ]]; then

    echo "Preparing Documentation RELEASE"
    git fetch --unshallow || true
    make html

    echo "Deploying Documentation RELEASE to S3"
  fi

  if [[ "$TRAVIS_BRANCH" == "patch/"* ]]; then

    echo "Preparing Documentation PATCH..."
    git fetch --unshallow || true
    make html

    echo "Deploying Documentation PATCH to S3"
  fi
fi