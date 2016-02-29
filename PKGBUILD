# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: lolilolicon <lolilolicon_at_gmail_dot_com>

pkgname=vim-simpylfold
pkgver=1.1
pkgrel=1
pkgdesc='Vim plugin providing simple, correct folding for Python'
arch=('any')
url='https://github.com/tmhedberg/SimpylFold'
license=('custom')
depends=('vim>=7.3')
groups=('vim-plugins')
install=vimdoc.install
source=("https://github.com/tmhedberg/SimpylFold/archive/v$pkgver.tar.gz")
sha256sums=('e5dc725ac9ffdde3180a9bced262a6bc9666ddd1dad58f90cfc659397d72ac92')

package() {
  cd "SimpylFold-$pkgver"
  local _vimdir="$pkgdir/usr/share/vim/vimfiles"
  install -D -m644 {,"$_vimdir/"}"ftplugin/python/SimpylFold.vim"
  install -D -m644 {,"$_vimdir/"}"doc/SimpylFold.txt"
}
