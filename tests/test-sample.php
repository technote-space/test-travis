<?php
/**
 * Class SampleTest
 *
 * @package Test_Travis
 */

use PHPUnit\Framework\TestCase;

use Test_Travis\Classes\Models\Sample;

/**
 * @noinspection PhpUndefinedClassInspection
 * Sample test case.
 *
 * @mixin TestCase
 */
class SampleTest extends WP_UnitTestCase {

	/**
	 * @var WP_Framework
	 */
	protected static $app;

	/**
	 * @var Sample $sample
	 */
	private static $sample;

	/**
	 * @SuppressWarnings(StaticAccess)
	 */
	public static function setUpBeforeClass() {
		static::$app    = WP_Framework::get_instance( TEST_TRAVIS );
		static::$sample = Sample::get_instance( static::$app );
	}

	public function test_get_count1() {
		$this->assertEquals( 0, static::$sample->get_count() );
	}

	/**
	 * @depends test_get_count1
	 */
	public function test_filter() {
		$this->assertEquals( 1, static::$app->filter->apply_filters( 'filter_test' ) );
	}

	/**
	 * @depends test_filter
	 */
	public function test_get_count2() {
		$this->assertEquals( 1, static::$sample->get_count() );
	}

	/**
	 * @depends test_get_count2
	 */
	public function test_reset_count() {
		static::$sample->reset_count();
		$this->assertEquals( 0, static::$sample->get_count() );
	}
}
