# Maintainer: Christopher Loen  <christopherloen at gmail dot com>
# Contributor: Scott Lawrence <bytbox@gmail.com>
pkgname='python-libsass'
pkgver='0.11.1'
pkgrel=1
pkgdesc="Python binding for libsass CSS compiler"
arch=('any')
url='http://dahlia.kr/libsass-python/'
depends=('python')
makedepends=('libsass' 'python2-pip' 'python-pip')
source=('https://github.com/dahlia/libsass-python/releases/download/0.11.1/libsass-0.11.1.tar.gz')
license=('MIT')
sha256sums=('f060d7dab825942ca7f86d0c4adadf7d731a2e30f9bce6e4f010ad7d32adbf06')

package() {
	echo Installation may be a bit slow, please wait
        cd ${srcdir}/libsass-${pkgver}
	pip install --isolated --root="${pkgdir}" --no-deps --ignore-installed .
        pip2 install --isolated --root="${pkgdir}" --no-deps --ignore-installed .

}

