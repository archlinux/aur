# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=vim-colorscheme-alduin
pkgver=2.4.3
pkgrel=1
pkgdesc="A dark low-contrast Vim colorscheme for Terminal Vim and GUI Vim."
arch=('any')
url="https://github.com/AlessandroYorba/Alduin"
license=('MIT')
source=("https://github.com/AlessandroYorba/Alduin/archive/v${pkgver}.tar.gz")
md5sums=('17b44e56970cd649caf13a0d6081ff4d')
_name=Alduin

package() {
  cd "$_name-$pkgver"
  install -Dm644 colors/alduin.vim "$pkgdir/usr/share/vim/vim74/colors/alduin.vim"
}

# vim:set ts=2 sw=2 et:
