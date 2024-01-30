#!/bin/sh
# Maintainer: hairlinehd <slimender123@gmail.com>
pkgname='obgk'
pkgver=r15.5f6c067
pkgrel=1
pkgdesc="osu!stable video and background deleter"
arch=('x86_64')
url="https://github.com/shoplifterhd/obgk"
license=('Unlicense')
depends=('findutils')
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
	echo "installing"
} 

package () {
	cd "$pkgname"
	install -Dm755 ./obgk "$pkgdir/usr/bin/obgk"
}
