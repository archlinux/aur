#!/bin/sh
# Maintainer: hairlinehd <slimender123@gmail.com>
pkgname='obgk'
_pkgname='osu'
pkgver=latest
pkgrel=1
pkgdesc="osu!stable video and background deleter"
arch=('x86_64')
url="https://github.com/shoplifterhd/obgk"
license=('Unlicense')
depends=('findutils' 'bash')
makedepends=('git')
optdepends=('zenity: nice gui to select your songs folder')
source=('git+https://github.com/shoplifterhd/obgk.git')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	# idk a better way to ignore build()
	echo "installing"
} 

package () {
	cd "$pkgname"
	install -Dm755 ./obgk "$pkgdir/usr/bin/obgk"
}
