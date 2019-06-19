#!/usr/bin/env bash

bash ${TRAVIS_BUILD_DIR}/tests/bin/php/install-composer.sh
bash ${TRAVIS_BUILD_DIR}/tests/bin/js/install-npm.sh

composer coveralls --working-dir=${TRAVIS_BUILD_DIR}
npm run coveralls --prefix ${TRAVIS_BUILD_DIR}/assets/js
