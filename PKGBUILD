# Maintainer: SanskritFritz (gmail)

pkgname=fontypython
pkgver=0.5
pkgrel=1
pkgdesc="Manage, view and find your fonts."
arch=('any')
url="https://savannah.nongnu.org/projects/fontypython"
license=('GPL3')
depends=('wxpython')
source=("http://download.savannah.nongnu.org/releases/fontypython/fontypython-$pkgver.tar.gz")
sha256sums=('46f5304f9ec790b0b870f66a37b5fd47103a9300d0e0ed98e8799bd59bb4ec1b')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python2 setup.py build
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python2 setup.py install --root="${pkgdir}" --prefix=/usr

}
