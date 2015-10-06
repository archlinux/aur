# Maintainer: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/python2-dialog

pkgname=python2-pythondialog
_pkgname=pythondialog
pkgver=3.3.0
pkgrel=1
pkgdesc="Python package for interfacing with dialog"
url="http://pythondialog.sf.net"
arch=('any')
license=('LGPL')
depends=('python2' 'dialog')
makedepends=('binutils')
conflicts=("${_pkgname}")
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/python2-${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('04e93f24995c43dd90f338d5d865ca72ce3fb5a5358d4daa4965571db35fc3ec')

package() {
  cd "${srcdir}/python2-${_pkgname}-${pkgver}"
  python2 ./setup.py install --prefix=/usr --root="${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:
