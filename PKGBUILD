# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=vim-colorscheme-sierra
pkgver=2.3.6
pkgrel=1
pkgdesc="A Vim colorscheme."
arch=('any')
url="https://github.com/AlessandroYorba/Sierra"
license=('MIT')
source=("https://github.com/AlessandroYorba/Sierra/archive/v${pkgver}.tar.gz")
md5sums=('d1cc6cd9ae33b3e8ca2a707a90847d75')
_name=Sierra

package() {
  cd "$_name-$pkgver"
  install -Dm644 colors/sierra.vim "$pkgdir/usr/share/vim/vim74/colors/sierra.vim"
}

# vim:set ts=2 sw=2 et:
