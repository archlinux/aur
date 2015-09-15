# Contributor: megadriver <megadriver at gmx dot com>

pkgname=xonsh
pkgver=0.2.0
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="http://xonsh.org"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
source=("https://github.com/scopatz/xonsh/archive/$pkgver.zip")
install=xonsh.install
sha256sums=('3ddb954db2738fd7e765eeba554a80f8895f543e71b0eec64aefa816db2f86e1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
