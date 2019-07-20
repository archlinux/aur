# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-colorscheme-forest-night-git
pkgdesc="Comfortable & Pleasant VIM Color Scheme"
pkgrel=1
pkgver=v0.4.r6.g20850ed
arch=('any')
url="https://github.com/sainnhe/vim-color-forest-night"
license=('MIT' 'Anti-996')
md5sums=('SKIP')
makedepends=('git')
depends=('vim')
_pkgname=vim-color-forest-night
source=("git+https://github.com/sainnhe/vim-color-forest-night.git")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 colors/forest-night.vim "$pkgdir/usr/share/vim/vimfiles/colors/forest-night.vim"
  install -Dm644 colors/forest-dusk.vim "$pkgdir/usr/share/vim/vimfiles/colors/forest-dusk.vim"
}

# vim:set ts=2 sw=2 et:
