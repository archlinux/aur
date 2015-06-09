# Contributor: megadriver <megadriver at gmx dot com>

pkgname=xonsh
pkgver=0.1.6
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="http://xonsh.org"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
source=("https://github.com/scopatz/xonsh/archive/$pkgver.zip")
install=xonsh.install
md5sums=('883093007aa31183f66ec26692aceb1a')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
