# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Andrew Conkling <andrewski@fr.st>
# Contributor: hauptmech <hauptmech@gmail.com>
pkgname=python2-empy
realname=empy
pkgver=3.3
pkgrel=5
pkgdesc="A powerful and robust templating system for Python."
arch=(i686 x86_64)
url="http://www.alcyone.com/software/empy"
depends=('python2>=1.5.2')
license=('LGPL')
source=("http://www.alcyone.com/software/empy/empy-$pkgver.tar.gz")
md5sums=('e7b518a6fc4fd28fef87726cdb003118')

build() {
    cd ${srcdir}/empy-$pkgver
    python2 setup.py build
}

package() {
    cd ${srcdir}/empy-$pkgver
    python2 setup.py install -O2 --skip-build --prefix=/usr --root=${pkgdir}
}
