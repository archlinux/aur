#!/bin/sh

export PHP_HOME=/opt/typephp/php
export PHPX_HOME=/opt/typephp/vendor/swoole/phpx
export PHP_INI_SCAN_DIR="${PHP_HOME}/conf.d"
export LD_LIBRARY_PATH="${PHPX_HOME}/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

exec /opt/typephp/tpc "$@"
