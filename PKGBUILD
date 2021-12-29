# Maintainer: MelianMiko <mikigaru@zohomail.com>
pkgname=mibandpreview-git
pkgver=0.9
pkgrel=1
pkgdesc="Simple preview tool for Mi Band 4-6 watchfaces"
arch=(any)
url="https://melianmiko.ru/mibandpreview"
license=('Apache')
depends=(python-certifi python-pillow python python-pyqt5)
makedepends=(make qt5-tools python-setuptools)
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/mibandpreview.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}

