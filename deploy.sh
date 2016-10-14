#!/bin/bash

set -e -u

# Sphinx Build
sudo pip install --upgrade pip
sudo pip install sphinx
make html

# S3 Deploy
sudo pip install awscli
echo "Deploying to bucket: $AWS_BUCKET"
aws s3 sync _build/html s3://$AWS_BUCKET/latest

# if [[ "$TRAVIS_REPO_SLUG" == "perfectsense/"* ]] && \
#    [ "$TRAVIS_PULL_REQUEST" == "false" ]; then

#   if [[ "$TRAVIS_BRANCH" == "release/"* ]]; then

#     echo "Preparing Documentation RELEASE"
#     git fetch --unshallow || true
#     make html

#     echo "Deploying Documentation RELEASE to S3"
#   fi

#   if [[ "$TRAVIS_BRANCH" == "patch/"* ]]; then

#     echo "Preparing Documentation PATCH..."
#     git fetch --unshallow || true
#     make html

#     echo "Deploying Documentation PATCH to S3"
#   fi
# fi