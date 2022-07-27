#!/usr/bin/gawk -f

@include "join"
@include "inplace"

function getpackage(exe,   c, s, a) {
    c = sprintf("pacman -Fqx '(^|/)bin/([a-z0-9_-]+/)?%s$'", exe)

    printf "Running %s\n", c > "/dev/stderr"

    c | getline s
    close(c)

    split(s, a, "/")
    return a[2]
}

BEGIN {
    for (i = 1; i < ARGC; i++)
        delete ARGV[i]

    ARGV[1] = "PKGBUILD"
    ARGC = 2

    FS = "\t"

    cmd = "src/ctpv/deptable/list.awk src/ctpv/sh/prev/*"

    while ((cmd | getline) > 0) {
        progs_len = split($2, progs, " ")

        for (i = 1; i <= progs_len; i++) {
            p = getpackage(progs[i])
            package_progs[p][++package_progs_len[p]] = $1
        }
    }

    close(cmd)

    for (p in package_progs) {
        types = join(package_progs[p], 1, package_progs_len[p], ", ")
        list = list sprintf("    '%s: for %s files'\n", p, types)
    }
}

/^\)/ {
    opts = 0
}

!opts

/^optdepends=\(/ {
    printf "%s", list | "sort"
    close("sort")
    opts = 1
}
