# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=vim-colorscheme-alduin
pkgver=1.8.2
pkgrel=1
pkgdesc="A dark low-contrast Vim colorscheme for Terminal Vim and GUI Vim."
arch=('any')
url="https://github.com/AlessandroYorba/Alduin"
license=('MIT')
source=("https://github.com/AlessandroYorba/Alduin/archive/${pkgver}.tar.gz")
md5sums=('8cdc5a5d48427f7fbd9ca6f57876e1ae')

_name=Alduin

package() {
  cd "$_name-$pkgver"
  install -Dm644 colors/alduin.vim "$pkgdir/usr/share/vim/vim74/colors/alduin.vim"
}

# vim:set ts=2 sw=2 et:
