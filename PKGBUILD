# Maintainer: Hexchain Tong <i at hexchain dot org>
pkgname=neovim-remote
pkgver=1.1
pkgrel=1
pkgdesc="Support --remote and friends for Neovim"
arch=(any)
url="https://github.com/mhinz/neovim-remote"
license=('GPL')
depends=('python-neovim')
source=("https://github.com/mhinz/neovim-remote/archive/v${pkgver}.tar.gz")
sha1sums=('a38a49e5a6e881e00194ce9e2393d2bc93793541')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 nvr "$pkgdir/usr/bin/nvr"
}

# vim:set ts=2 sw=2 et:
