# Maintainer: Kyle Terrien <kyleterrien at gmail dot com>
pkgname=bluecurve-metacity-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Bluecurve window borders for Metacity"
arch=(any)
url="https://fedoraproject.org/wiki/Design"
license=('GPL')
depends=()
optdepends=('marco: supported window manager'
		'metacity: supported window manager')
md5sums=('3b3c9d0cd1f41f930d2ce49e8cfcba95')
source=("http://pkgs.fedoraproject.org/repo/pkgs/$pkgname/$pkgname-$pkgver.tar.bz2/${md5sums[0]}/$pkgname-$pkgver.tar.bz2")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

# vi: noet ts=4 sw=4 :
