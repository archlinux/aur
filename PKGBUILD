# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=vim-colorscheme-alduin
pkgver=2.4.4
pkgrel=1
pkgdesc="A dark low-contrast Vim colorscheme for Terminal Vim and GUI Vim."
arch=('any')
url="https://github.com/AlessandroYorba/Alduin"
license=('MIT')
source=("https://github.com/AlessandroYorba/Alduin/archive/v.${pkgver}.tar.gz")
md5sums=('51107e0ff75a0c4e1570f115cd59ec41')
_name=Alduin

package() {
  cd "$_name-v.$pkgver"
  install -Dm644 colors/alduin.vim "$pkgdir/usr/share/vim/vim74/colors/alduin.vim"
}

# vim:set ts=2 sw=2 et:
