# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=stuga
pkgver=3
pkgrel=1
pkgdesc="An ancient Swedish text-based adventure game with roots from 1978"
arch=('any')
url="http://microheaven.com/svenska/stuga.shtml"
license=('unknown')
groups=(games)
depends=(gargoyle)
source=("http://microheaven.com/svenska/filarkiv/Stuga.z5" "Stuga.desktop")
noextract=("Stuga.z5")
md5sums=("3d6051d630820e6d3034e62e60d7ac1b" "591c06e0419d831f7964a64a13ca6421")

package() {
	mkdir -p "$pkgdir/usr/games/stuga"
	mkdir -p "$pkgdir/usr/share/applications"
	install -m666 "$srcdir/Stuga.z5" "$pkgdir/usr/games/stuga/"
	install -m777 "$srcdir/Stuga.desktop" "$pkgdir/usr/share/applications/"
}
