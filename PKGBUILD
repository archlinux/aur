# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=pyfluidsynth
pkgver=1.2.4
pkgrel=3
pkgdesc="Python bindings for FluidSynth"
arch=('any')
url="http://code.google.com/p/pyfluidsynth"
license=('LGPL')
depends=('fluidsynth' 'python2-numpy')
source=(http://pypi.python.org/packages/source/p/pyFluidSynth/pyFluidSynth-$pkgver.tar.gz)
md5sums=('60079310701d0b9298b65a8b6728ffcc')

build() {
	cd "$srcdir/pyFluidSynth-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/pyFluidSynth-$pkgver"
	python2 setup.py install --prefix=$pkgdir/usr
}
