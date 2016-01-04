# Contributor: megadriver <megadriver at gmx dot com>

pkgname=xonsh
pkgver=0.2.4
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="http://xonsh.org"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
optdepends=('python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit')
source=("https://github.com/scopatz/xonsh/archive/$pkgver.zip")
install=xonsh.install
sha256sums=('4a8c30487cb30dd1a2c23e637609ad02b091c617ed026aa32082479ad72d515b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
