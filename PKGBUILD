# Contributor  kusakata <shohei atmark kusakata period com>
# Maintainer chron <chronischzuspaet at gmail dot com>>

pkgname=glogic
pkgver=2.6
pkgrel=2
pkgdesc='An educational graphical logic circuit simulator'
arch=('any')
url="https://launchpad.net/glogic"
license=('GPL3')
depends=('hicolor-icon-theme' 'intltool' 'python' 'python-cairo')
makedepends=('itstool')
install=glogic.install
source=("https://launchpad.net/glogic/trunk/${pkgver}/+download/glogic-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/glogic-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/glogic-${pkgver}"
	make DESTDIR="$pkgdir" install
}

sha256sums=('62fabbc39aa7d72491fb83aa0547385cbb89d7a593ad2fb80b019607593d1bde')
