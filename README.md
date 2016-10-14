# Travis Sphinx Deploy

Setup:

This script requires that your build has `sudo: required` in your .travis.yml due
to `sudo` usage.

Performs the following actions:

Updates pip
Installs sphinx
Runs Sphinx
Deploys Sphinx site to S3