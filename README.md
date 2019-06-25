# Test Travis

[![Build Status](https://travis-ci.com/technote-space/test-travis.svg?branch=master)](https://travis-ci.com/technote-space/test-travis)
[![Coverage Status](https://coveralls.io/repos/github/technote-space/test-travis/badge.svg?branch=master)](https://coveralls.io/github/technote-space/test-travis?branch=master)
[![CodeFactor](https://www.codefactor.io/repository/github/technote-space/test-travis/badge)](https://www.codefactor.io/repository/github/technote-space/test-travis)
[![License: GPL v2+](https://img.shields.io/badge/License-GPL%20v2%2B-blue.svg)](http://www.gnu.org/licenses/gpl-2.0.html)
[![PHP: >=5.6](https://img.shields.io/badge/PHP-%3E%3D5.6-orange.svg)](http://php.net/)
[![WordPress: >=5.0](https://img.shields.io/badge/WordPress-%3E%3D5.0-brightgreen.svg)](https://wordpress.org/)

Travis CI テスト用

## 要件
- PHP 5.6 以上
- WordPress 5.0 以上

## 構成
- code check
  - PHP
    - phpcs
    - phpmd
  - JavaScript
    - lint
- test
  - PHP
    - PHPUnit
      - PHP v5.6 - v7.2
      - WordPress v5.0 - latest
      - WordPress v3.9, v4.9 (allow_failures)
  - JavaScript
    - Jest
- deploy
  - GitHub releases
  - WP Directory

## Author
[GitHub (Technote)](https://github.com/technote-space)  
[Blog](https://technote.space)

## プラグイン作成用フレームワーク
[WP Content Framework](https://github.com/wp-content-framework/core)
