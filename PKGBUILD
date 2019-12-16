# Maintainer: Daniel Ruiz de Alegria <daniruizdealegria@gmail.com>

pkgname="flat-remix"
pkgver=20191216
pkgrel=1
pkgdesc="Flat remix is a pretty simple icon theme  inspired on material design following a modern design using "flat" colors with high contrasts and sharp borders."
arch=('any')
url="https://drasite.com/flat-remix"
license=('GPL 3.0')
options=('!strip')
source=("https://github.com/daniruiz/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	make install DESTDIR=${pkgdir}
}
