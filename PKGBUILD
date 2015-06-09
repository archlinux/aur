# Maintainer: ajs124 < aur AT ajs124 DOT de >
# Contributor: Daenyth <Daenyth+arch@gmail.com>

pkgname=fortune-mod-firefly
pkgver=2.1.2
pkgrel=1
pkgdesc="Fortune cookies from Joss Whedon's Firefly series."
arch=(any)
license=(unknown)
depends=(fortune-mod)
source="firefly::http://pkgs.fedoraproject.org/gitweb/?p=fortune-firefly.git;a=blob_plain;f=firefly;hb=master"
url="http://www.daughtersoftiresias.org/progs/firefly/"
md5sums=('0c3203d2afddad9e00189e9e27446b82')

build() {
	cd $srcdir/
	strfile firefly
}

package(){
	mkdir -p $pkgdir/usr/share/fortune
	cp $srcdir/firefly* $pkgdir/usr/share/fortune 
}
