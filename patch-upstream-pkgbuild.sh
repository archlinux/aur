#!/bin/sh -eu

sed "$1" \
	-e 's|^# Maintainer:|# Contributor:|' \
	-e '1i\# Maintainer: Thomas J Faughnan Jr <thomas@faughnan.net>' \
	-e 's|^pkgname=caddy|pkgname=caddy-he\n_pkgname=caddy|' \
	-e 's|^pkgdesc=.*|pkgdesc="Fast web server with automatic HTTPS (with Hurricane Electric DNS module)"\nprovides=(caddy)\nconflicts=(caddy)|' \
	-e 's|$pkgname|$_pkgname|g' \
	-e 's|${pkgname}|${_pkgname}|g' \
	-e 's|  use-data-dir-for-autosave.patch|  use-data-dir-for-autosave.patch\n  import-he-module.patch|' \
	-e 's|  GOFLAGS="-mod=readonly" go mod vendor -v|  # use Hurricane Electric module\n  patch -Np1 < "${srcdir}/import-he-module.patch"\n  go mod tidy\n\n  GOFLAGS="-mod=readonly" go mod vendor -v|'
