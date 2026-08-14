#!/usr/bin/env shed
vice -i -m ":%s/[0-9]+\.[0-9]+\.[0-9]+/$1/g"  PKGBUILD .SRCINFO
