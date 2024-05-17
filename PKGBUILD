# Maintainer: MelianMiko <melianmiko@gmail.com>
pkgname=zmake
pkgver=1.9.2
pkgrel=1
pkgdesc="Unofficial ZeppOS build system"
arch=(any)
url="https://melianmiko.ru/en/zmake"
license=('GPLv3')
depends=(python python-pillow python-qrcode)
makedepends=(make python-pip python)
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/zmake.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver/"
	make
}

package() {
	cd "$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir"
}

