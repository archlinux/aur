# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>

pkgname=python-pythondialog
pkgver=3.4.0
pkgrel=2
pkgdesc="Python package for interfacing with dialog"
url="http://pythondialog.sf.net"
arch=('any')
license=('LGPL')
depends=('python' 'dialog')
source=("http://downloads.sourceforge.net/project/pythondialog/pythondialog/$pkgver/python3-pythondialog-$pkgver.tar.bz2")
sha256sums=('019cdbffe3f61d32d6fb158ce48a767478af2aac2f31fb40460b39aefae604fe')

package() {
  cd pythondialog-$pkgver
  python ./setup.py install --prefix=/usr --root="$pkgdir" -O1
}

# vim:set ts=2 sw=2 et:
