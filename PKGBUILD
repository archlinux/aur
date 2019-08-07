# Maintainer: Alfonso Saaverda "Son Link" <sonlink.dourden@gmail.com>

pkgname=videomorph
pkgver=1.4
pkgrel=1
pkgdesc="Small GUI wrapper for FFMPEG based on PyQt5"
arch=('i686' 'x86_64')
url='https://github.com/videomorph-dev/videomorph'
license=('Apache-2.0')
depends=('python' 'ffmpeg' 'python-pyqt5')
source=('https://github.com/videomorph-dev/videomorph/archive/1.4.tar.gz')
md5sums=('5f2c19516d022b5c39ddf5c7316b82ea')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
   	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
