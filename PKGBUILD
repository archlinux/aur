# Maintainer: uint2048_t

pkgname=vim-breezy-git
pkgver=453167d
pkgrel=1
pkgdesc='Breezy is a (neo)vim true color scheme inspired by the KDE breeze palette'
arch=('any')
url="https://github.com/fneu/breezy"
license=('MIT')
makedepends=('git')
source=(git+https://github.com/fneu/breezy.git)
sha256sums=('SKIP')
	
pkgver() {
  cd breezy
  git rev-parse --short HEAD
}

package() {
  install -d "${pkgdir}/usr/share/vim/vimfiles/colors"
  install -Dm755 "${srcdir}/breezy/colors/breezy.vim" "${pkgdir}/usr/share/vim/vimfiles/colors"
}
