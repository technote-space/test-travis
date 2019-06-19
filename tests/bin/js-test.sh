#!/usr/bin/env bash

bash ${TRAVIS_BUILD_DIR}/tests/bin/setup-js-tests.sh
npm run jest --prefix ${TRAVIS_BUILD_DIR}/assets/js
