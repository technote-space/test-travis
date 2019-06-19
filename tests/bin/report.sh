#!/usr/bin/env bash

travis_retry php ${TRAVIS_BUILD_DIR}/vendor/bin/php-coveralls -v
travis_retry npm --prefix ${TRAVIS_BUILD_DIR}/assets/js run coveralls
