# Maintainer: MelianMiko <melianmiko@gmail.com>
pkgname=openfreebuds
pkgver=0.11
pkgrel=1
pkgdesc="Manager for HUAWEI FreeBuds"
arch=(any)
url="https://melianmiko.ru/openfreebuds"
license=('GPLv3')
depends=(python dbus-python python-gobject libappindicator-gtk3 gtk3 tk bluez python-pillow python-six python-xlib)
makedepends=(make python-pip python)
source=("$pkgname-$pkgver::git+https://github.com/melianmiko/openfreebuds.git")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver/"
	make
}

package() {
	cd "$pkgname-$pkgver/"
	make install DESTDIR="$pkgdir"
}

