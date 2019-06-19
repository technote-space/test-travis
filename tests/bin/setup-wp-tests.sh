#!/usr/bin/env bash

if [[ -f ~/.phpenv/versions/$(phpenv version-name)/etc/conf.d/xdebug.ini ]]; then
	phpenv config-rm xdebug.ini
else
	echo "xdebug.ini does not exist"
fi
bash ${TRAVIS_BUILD_DIR}/tests/bin/install-wp-tests.sh wordpress_test root '' localhost ${WP_VERSION}
composer install -n --working-dir=${TRAVIS_BUILD_DIR}
