# Maintainer: Juan-Pablo Scaletti
# Contributor: Fabien Devaux <fdev31 at gmail dot com>

_name=Moar
pkgname=python2-moar
pkgver=1.3.2
pkgrel=1
pkgdesc="Easy thumbnails for everyone"
url="http://github.com/lucuma/Moar"
arch=('i686' 'x86_64')
license=("GPL")
depends=("python2" "python-imaging")

source=("http://pypi.python.org/packages/source/M/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('cf68132d2546a58dec7f684891e98cbb')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
