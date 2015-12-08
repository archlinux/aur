# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

_pkgname=python-wifi
pkgname=python2-wifi
pkgver=0.6.1
pkgrel=1
pkgdesc="A Python module that provides read and write access to a wireless network card's capabilities using the Linux Wireless Extensions."
arch=('any')
url="https://pypi.python.org/pypi/python-wifi"
license=('LGPL' 'GPL')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
md5sums=('033227169230286a63b9c059e7465c77')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}