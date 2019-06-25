<?php
/**
 * Plugin Name: Test Travis
 * Plugin URI: https://github.com/technote-space/test-travis
 * Description: Test plugin for Travis CI
 * Author: Technote
 * Version: 0.0.20
 * Author URI: https://technote.space
 * Text Domain: test-travis
 * Domain Path: /languages/
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

if ( defined( 'TEST_TRAVIS' ) ) {
	return;
}

define( 'TEST_TRAVIS', 'Test_Travis' );

@require_once dirname( __FILE__ ) . DIRECTORY_SEPARATOR . 'vendor' . DIRECTORY_SEPARATOR . 'autoload.php';

WP_Framework::get_instance( TEST_TRAVIS, __FILE__ );
