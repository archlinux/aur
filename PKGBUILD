# Maintainer: Hexchain Tong <i at hexchain dot org>
pkgname=neovim-remote
pkgver=1.9.0
pkgrel=1
pkgdesc="Support --remote and friends for Neovim"
arch=(any)
url="https://github.com/mhinz/neovim-remote"
license=('GPL')
depends=('python-neovim' 'python-psutil')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/mhinz/neovim-remote.git#tag=v${pkgver}")
sha1sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
