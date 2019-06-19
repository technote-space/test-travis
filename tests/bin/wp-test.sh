#!/usr/bin/env bash

bash ${TRAVIS_BUILD_DIR}/tests/bin/setup-wp-tests.sh
composer phpunit --working-dir=${TRAVIS_BUILD_DIR}
