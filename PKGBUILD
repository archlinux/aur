# Maintainer: Alexander Keller <git@nycroth.com>

pkgname=python2-keyczar
pkgver=0.715
pkgrel=1
pkgdesc="Toolkit for safe and simple cryptography for python2"
url="http://www.keyczar.org/"
arch=('i686' 'x86_64')
license=("APACHE")
depends=("python2", "python2-pyasn1")
source=("https://pypi.python.org/packages/source/p/python-keyczar/python-keyczar-${pkgver}.tar.gz")
md5sums=('bdb47448f622fdfea7851327a5f20476')

build() {
  cd "${srcdir}/python-keyczar-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-keyczar-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
