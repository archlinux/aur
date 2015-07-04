#!/bin/bash

post_install() {
  printf "==> Run 'pkgfile --update' to initialize the database\n"
}

post_remove() {
  # the cache dir might not be removed, notify the user
  if [ -d var/cache/pkgfile ]; then
    printf "==> /var/cache/pkgfile has not been removed\n"
  fi
}
