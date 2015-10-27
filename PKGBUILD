# Contributor: megadriver <megadriver at gmx dot com>

pkgname=xonsh
pkgver=0.2.2
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="http://xonsh.org"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
optdepends=('python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit')
source=("https://github.com/scopatz/xonsh/archive/$pkgver.zip")
install=xonsh.install
sha256sums=('bcc868ad3e28e9092bcd99eb04601320afe11bc7518a18df26481c0c74d39d2f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
