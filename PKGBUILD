# $Id$
# Maintainer: Aaron Abbott <aabmass AT gmail DOT com>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>

pkgname=('python-sqlparse-mycli')
pkgver=0.1.19
pkgrel=1
pkgdesc='Non-validating SQL parser for Python; version for mycli in AUR'
arch=('any')
url=https://github.com/andialbrecht/sqlparse
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/9c/cc/3d8d34cfd0507dd3c278575e42baff2316a92513de0a87ac0ec9f32806c9/sqlparse-0.1.19.tar.gz")
md5sums=('f200d8dea67b58bc15575bfa76e4e9dc')
provides=('python-sqlparse=0.1.19')
conflicts=('python-sqlparse')

package() {
  depends=('python')

  cd sqlparse-$pkgver/
  python setup.py install --prefix=/usr --root="$pkgdir"
#  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
