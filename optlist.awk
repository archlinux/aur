#!/usr/bin/gawk -f

@include "join"

BEGIN {
  len = 0

  extra["chafa"] = " on Wayland"
  extra["ueberzug"] = " on X11"
}

BEGINFILE {
  line = 0
}

line == 0 {
  type = $0
}

line == 1 {
  sub(/.*\//, "")
  package = $0
  package_type[package][++package_type_len[package]] = type
}

{
  line++
}

ENDFILE {
  len++
}

END {
    for (package in package_type) {
        types = join(package_type[package], 1, package_type_len[package], ", ")
        printf "    '%s: for %s files%s'\n", package, types, extra[package]
    }
}
