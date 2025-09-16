# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=vim-seti
pkgver=1.0.0
pkgrel=7
pkgdesc="Colorscheme based on Jesse Weed's Seti theme for the Atom editor"
arch=(any)
url='https://github.com/trusktr/seti.vim'
license=(custom:unknown)
groups=(vim-plugins)
depends=(vim-plugin-runtime)
makedepends=(git)
source=("$pkgname::git+$url#commit=a4781817e75a627b54403a92683516aee6230091") # 2016-04-16
b2sums=('e09d94e51c02b9ca002b45b59ab8bc6f51b1e5886e11630e27886f43adf270749ca597ea0e823b479d8ff735b118588448d37822680523f57599259ffaf1aaff')

package() {
  install -Dm644 $pkgname/colors/seti.vim "$pkgdir/usr/share/vim/vimfiles/colors/seti.vim"
}
