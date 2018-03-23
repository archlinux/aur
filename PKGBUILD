# Maintainer: Hexchain Tong <i at hexchain dot org>
pkgname=neovim-remote
pkgver=2.0.2
pkgrel=1
pkgdesc="Support --remote and friends for Neovim"
arch=(any)
url="https://github.com/mhinz/neovim-remote"
license=('MIT')
depends=('python-neovim' 'python-psutil')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/mhinz/neovim-remote.git#tag=v${pkgver}")
sha1sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
