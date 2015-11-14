# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>

pkgname=python-pythondialog
pkgver=3.3.0
pkgrel=1
pkgdesc="Python package for interfacing with dialog"
url="http://pythondialog.sf.net"
arch=('any')
license=('LGPL')
depends=('python' 'dialog')
source=("http://downloads.sourceforge.net/project/pythondialog/pythondialog/${pkgver}/python3-pythondialog-${pkgver}.tar.bz2")
sha256sums=('e4ace5b09d712992b7327249e375e49608127666679b2ca9fd48141e218ec998')

package() {
  cd "${srcdir}/pythondialog-${pkgver}"
  python ./setup.py install --prefix=/usr --root="${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:
