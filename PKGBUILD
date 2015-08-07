# Maintainer: Kevin Rauwolf <sweetpea-aur@tentacle.net>
pkgname=python2-taglib
pkgver=3.1
pkgrel=2
pkgdesc="Python library to read and manipulate audio media metadata"
arch=(any)
url="https://code.google.com/p/python-taglib/"
license=('BSD')
depends=('python2')
optdepends=('python2-imaging: for image support')
options=(!emptydirs)
source=("https://python-taglib.googlecode.com/files/taglib-${pkgver}.tar.bz2")
md5sums=('9c9209359ba2ccf768cf5da5a64a1edb')

build() {
  cd "${srcdir}/taglib-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/taglib-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
