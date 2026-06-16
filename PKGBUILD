# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ulid-c
pkgdesc='Tool to generate Unique Lexicographically-sortable Identifiers (ULIDs)'
pkgver=0.1.3
pkgrel=1
url=https://codeberg.org/aperezdc/ulid-c
license=(MIT)
depends=(glibc)
arch=(x86_64)
source=("$url/releases/download/v$pkgver/ulid-c-$pkgver.tar.lz")
sha256sums=('d6103b531b5a15a4cdc52a69ae8dd1bc27e06d18b9f16ff4125f02763ec623ac')

build () {
	cd "$pkgname-$pkgver"
	make
}

package () {
	install -Dm755 -t "$pkgdir/usr/bin" "$pkgname-$pkgver/ulid"
}
