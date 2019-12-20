# Test Travis

[![CI Status](https://github.com/technote-space/test-travis/workflows/CI/badge.svg)](https://github.com/technote-space/test-travis/actions)
[![Build Status](https://travis-ci.com/technote-space/test-travis.svg?branch=master)](https://travis-ci.com/technote-space/test-travis)
[![codecov](https://codecov.io/gh/technote-space/test-travis/branch/master/graph/badge.svg)](https://codecov.io/gh/technote-space/test-travis)
[![CodeFactor](https://www.codefactor.io/repository/github/technote-space/test-travis/badge)](https://www.codefactor.io/repository/github/technote-space/test-travis)
[![License: GPL v2+](https://img.shields.io/badge/License-GPL%20v2%2B-blue.svg)](http://www.gnu.org/licenses/gpl-2.0.html)
[![PHP: >=5.6](https://img.shields.io/badge/PHP-%3E%3D5.6-orange.svg)](http://php.net/)
[![WordPress: >=5.0](https://img.shields.io/badge/WordPress-%3E%3D5.0-brightgreen.svg)](https://wordpress.org/)

Travis CI テスト用

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [要件](#%E8%A6%81%E4%BB%B6)
- [構成](#%E6%A7%8B%E6%88%90)
- [Dependency](#dependency)
- [Author](#author)
- [プラグイン作成用フレームワーク](#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E4%BD%9C%E6%88%90%E7%94%A8%E3%83%95%E3%83%AC%E3%83%BC%E3%83%A0%E3%83%AF%E3%83%BC%E3%82%AF)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 要件
- PHP 5.6 以上
- WordPress 5.0 以上

## 構成
- Travis CI
  - code check
    - PHP
      - PHP_CodeSniffer
      - PHPMD
    - JavaScript
      - ESLint
  - test
    - PHP
      - PHPUnit
        - PHP v5.6 - v7.3
        - WordPress v5.0 - latest
    - JavaScript
      - Jest
  - coverage
    - codecov
- GitHub Actions
  - code check
    - PHP
      - PHP_CodeSniffer
      - PHPMD
    - JavaScript
      - ESLint
  - test
    - PHP
      - PHPUnit
        - PHP v5.6 - v7.3
        - WordPress v5.0 - latest
    - JavaScript
      - Jest
  - deploy
    - GitHub releases

## Dependency
[Scripts for Travis CI](https://github.com/wp-content-framework/travis-ci)

## Author
[GitHub (Technote)](https://github.com/technote-space)  
[Blog](https://technote.space)

## プラグイン作成用フレームワーク
[WP Content Framework](https://github.com/wp-content-framework/core)
