#!/usr/bin/env bash

set -ex
bash ${TRAVIS_BUILD_DIR}/tests/bin/js/install-npm.sh
npm run lint --prefix ${TRAVIS_BUILD_DIR}/assets/js
