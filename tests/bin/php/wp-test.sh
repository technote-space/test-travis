#!/usr/bin/env bash

set -ex
bash ${TRAVIS_BUILD_DIR}/tests/bin/php/setup-wp-tests.sh
composer phpunit --working-dir=${TRAVIS_BUILD_DIR}

if [[ ! -z "$COVERAGE_REPORT" ]] ; then
  composer coveralls --working-dir=${TRAVIS_BUILD_DIR}
fi
