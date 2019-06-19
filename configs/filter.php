<?php
/**
 * @version 0.0.1
 * @author Technote
 * @since 0.0.1
 * @copyright Technote All Rights Reserved
 * @license https://opensource.org/licenses/gpl-2.0.php GNU General Public License, version 2
 * @link https://technote.space/
 */

if ( ! defined( 'TEST_TRAVIS' ) ) {
	exit;
}

return [

	'\Test_Travis\Classes\Models\Sample' => [
		'${prefix}filter_test' => [
			'filter_test',
		],
	],
];
