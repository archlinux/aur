# Maintainer: Maikel Llamaret Heredia "llamaret" <llamaret@webmisolutions.com>

pkgname=videomorph
pkgver=1.4
pkgrel=1
pkgdesc="Small GUI wrapper for FFMPEG based on PyQt5"
arch=('i686' 'x86_64')
url='https://github.com/videomorph-dev/videomorph'
license=('Apache-2.0')
depends=('python' 'ffmpeg' 'python-pyqt5')
source=('https://github.com/videomorph-dev/videomorph/archive/1.4.tar.gz')
md5sums=('46789b8c4bb7157f6ca38116212debf7')

build() {
	cd ${pkgname}-${pkgver}
	python setup.py build
}

package() {
	cd ${pkgname}-${pkgver}
   	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
