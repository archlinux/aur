# $Id$
# Maintainer: Aaron Abbott <aabmass AT gmail DOT com>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>

pkgname=('python-sqlparse-mycli')
pkgver=0.2.0
pkgrel=2
pkgdesc='Non-validating SQL parser for Python; version for mycli in AUR'
arch=('any')
url=https://github.com/andialbrecht/sqlparse
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/48/e4/ecd908ef40a9d0e78fc40f3abd2f329dd96b82402fee07f14dbf69948f1b/sqlparse-0.2.0.tar.gz")
md5sums=('d0dde71546b4a37e72c0c607252ad942')
provides=('python-sqlparse=0.2.0')
conflicts=('python-sqlparse')

package() {
  depends=('python')

  cd sqlparse-$pkgver/
  python setup.py install --prefix=/usr --root="$pkgdir"
#  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
