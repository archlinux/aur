# Maintainer: Daniel Ruiz de Alegria <daniel@drasite.com>

pkgname="skeuos-gtk"
pkgver=20220629
pkgrel=1
pkgdesc="Light and Dark window themes based on a Skeuomorphic design."
arch=('any')
url="https://github.com/daniruiz/skeuos-gtk"
license=('GPL3')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daniruiz/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	make install DESTDIR=${pkgdir}
}
