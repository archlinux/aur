# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-colorscheme-forest-night-git
pkgdesc="Comfortable & Pleasant VIM Color Scheme"
pkgrel=1
pkgver=v0.1.0.r7.g5d964ff
arch=('any')
url="https://github.com/sainnhe/forest-night"
license=('MIT')
md5sums=('SKIP')
makedepends=('git')
depends=('vim')
_pkgname=forest-night
source=("git+https://github.com/sainnhe/forest-night.git")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 colors/forest-night.vim "$pkgdir/usr/share/vim/vimfiles/colors/forest-night.vim"
}

# vim:set ts=2 sw=2 et:
