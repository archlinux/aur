# Maintainer: Maikel Llamaret Heredia "llamaret" <llamaret@webmisolutions.com>

pkgname=videomorph
pkgver=1.4.1-2
pkgrel=0
pkgdesc="Small GUI wrapper for FFMPEG based on PyQt5"
arch=('i686' 'x86_64')
url='https://github.com/videomorph-dev/videomorph'
license=('Apache-2.0')
depends=('python' 'ffmpeg' 'python-pyqt5')
source=('https://github.com/videomorph-dev/videomorph/archive/1.4.1.tar.gz')
md5sums=('79e370fc3c590b970ced1d71f49fdcde')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
   	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
