# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-colorscheme-forest-night-git
pkgdesc="Comfortable & Pleasant VIM Color Scheme"
pkgrel=1
pkgver=v0.2.r6.g349baee
arch=('any')
url="https://github.com/sainnhe/vim-color-forest-night"
license=('MIT', 'Anti-996')
md5sums=('SKIP')
makedepends=('git')
_pkgname=vim-color-forest-night
source=("git+https://github.com/sainnhe/vim-color-forest-night.git")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 colors/forest-night.vim "$pkgdir/usr/share/vim/vimfiles/colors/forest-night.vim"
}

# vim:set ts=2 sw=2 et:
