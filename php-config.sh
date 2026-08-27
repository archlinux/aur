#!/bin/sh

case "$1" in
  --prefix)
    printf '%s\n' /opt/typephp/php
    ;;
  --include-dir)
    printf '%s\n' /opt/typephp/php/include/php
    ;;
  --includes)
    /usr/bin/php-config --includes | \
      sed 's|/usr/include/php|/opt/typephp/php/include/php|g'
    ;;
  --php-binary)
    printf '%s\n' /opt/typephp/php/bin/php
    ;;
  *)
    exec /usr/bin/php-config "$@"
    ;;
esac
