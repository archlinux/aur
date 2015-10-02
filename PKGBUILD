# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

_pkgname=python-wifi
pkgname=python-wifi
pkgver=0.6.0
pkgrel=3
pkgdesc="A Python module that provides read and write access to a wireless network card's capabilities using the Linux Wireless Extensions."
arch=('any')
url="https://pypi.python.org/pypi/python-wifi"
license=('LGPL' 'GPL')
depends=('python')
makedepends=('python-distribute')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('f9d520a8c17b0dfffce95a8a7efba7dd')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}