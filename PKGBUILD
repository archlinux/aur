#Maintainer: Yucef Sourani <youssef.m.sourani@gmail.com>
pkgname=pysavetube
pkgver=1.0
pkgrel=3
pkgdesc="Videos Downloader."
arch=('any')
url="https://github.com/yucefsourani/${pkgname}"
license=('GPL3')
depends=('python' 'gtk3' 'python-gobject' 'gettext' 'libhandy' 'gnome-icon-theme')
makedepends=('git' 'gettext')
source=("$pkgname"::"git+https://github.com/yucefsourani/pysavetube.git")
sha256sums=('SKIP')

package() {
	cd "$pkgname"
	make install DESTDIR="$pkgdir" INSTALL="/usr/bin/install -p"
}

