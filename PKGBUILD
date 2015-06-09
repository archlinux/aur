pkgname=python3-pythondialog
_pkgname=pythondialog
pkgver=3.2.1
pkgrel=1
pkgdesc="Python package for interfacing with dialog"
url="http://pythondialog.sf.net"
arch=('any')
license=('LGPL')
depends=('python' 'dialog')
makedepends=('binutils')
conflicts=("${_pkgname}")
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/python3-${_pkgname}-${pkgver}.tar.bz2")
md5sums=('44b1630e147ad389c06b2bf82bd21981')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:
