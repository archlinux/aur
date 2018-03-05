# Maintainer: SanskritFritz (gmail)

pkgname=fontypython
pkgver=0.4.6
pkgrel=1
pkgdesc="Manage, view and find your fonts."
arch=('any')
url="https://savannah.nongnu.org/projects/fontypython"
license=('GPL3')
depends=('wxpython')
source=("http://download.savannah.nongnu.org/releases/fontypython/fontypython-$pkgver.tar.gz")
sha256sums=('fea84d85ade8f5bc5966a24b20cea501ff6d77745bbd545695e60b8bfe684901')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python2 setup.py build
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	python2 setup.py install --root="${pkgdir}" --prefix=/usr

}
