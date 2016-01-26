# Contributor: megadriver <megadriver at gmx dot com>

pkgname=xonsh
pkgver=0.2.5
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="http://xonsh.org"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
optdepends=('python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit')
source=("https://github.com/scopatz/xonsh/archive/$pkgver.zip")
install=xonsh.install
sha256sums=('a30c495de0af17869055bc7676155408577eb438c7970fa4ccbd193fd0d89081')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/license"
}
