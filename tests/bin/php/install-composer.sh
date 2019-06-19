#!/usr/bin/env bash

if [[ ! -z "$IGNORE_PLATFORM_REQS" ]] ; then
  composer install -n --working-dir=${TRAVIS_BUILD_DIR} --ignore-platform-reqs
else
  composer install -n --working-dir=${TRAVIS_BUILD_DIR}
fi
