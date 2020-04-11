# Maintainer: lans9831@gmail.com
_pkgname=goneovim
pkgname=gonvim-fork
pkgver=0.4.5
pkgrel=1
pkgdesc="Neovim GUI written in Golang - fork for the purpose of maintenance and enhancement"
arch=('any')
url="https://github.com/akiyosi/goneovim"
license=('mit')
depends=('neovim' 'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-svg' 'qt5-declarative' 'qt5-webchannel' 'qt5-webengine')
provides=("${_pkgname}")
conflicts=("gonvim")
source=("https://github.com/akiyosi/goneovim/releases/download/v$pkgver/Goneovim-$pkgver-linux.tar.bz2")
sha256sums=('d8137306e68929e4eb8d8bbb63e6b73187a496f57f63b5bfe04d000797d9bdf7')

package() {
  cd "Goneovim-$pkgver-linux"
  install -Dm 755 "${_pkgname}" -t "$pkgdir/usr/bin/"
}
