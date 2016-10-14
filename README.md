# Travis Sphinx Deploy

Setup:

This script requires that your build has `sudo: required` in your .travis.yml due
to `sudo` usage.

Performs the following actions:

Runs gulp
Deploys files to S3