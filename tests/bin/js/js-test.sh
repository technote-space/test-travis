#!/usr/bin/env bash

set -ex
bash ${TRAVIS_BUILD_DIR}/tests/bin/js/install-npm.sh
npm run jest --prefix ${TRAVIS_BUILD_DIR}/assets/js
