#!/usr/bin/env bash

bash ${TRAVIS_BUILD_DIR}/tests/bin/php/install-composer.sh
bash ${TRAVIS_BUILD_DIR}/tests/bin/js/install-npm.sh

travis_retry php ${TRAVIS_BUILD_DIR}/vendor/bin/php-coveralls -v
travis_retry npm --prefix ${TRAVIS_BUILD_DIR}/assets/js run coveralls
