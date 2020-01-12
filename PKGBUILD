# Maintainer: lans9831@gmail.com
_pkgname=goneovim
pkgname=gonvim-fork
pkgver=0.4.2
pkgrel=1
pkgdesc="Neovim GUI written in Golang - fork for the purpose of maintenance and enhancement"
arch=('any')
url="https://github.com/akiyosi/goneovim"
license=('mit')
depends=('neovim' 'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-svg' 'qt5-declarative' 'qt5-webchannel' 'qt5-webengine')
provides=("${_pkgname}")
conflicts=("gonvim")
source=("https://github.com/akiyosi/goneovim/releases/download/v$pkgver/Goneovim-$pkgver-linux.tar.bz2")
sha256sums=('ce07bf62b380e43bf6aee69b4b01b8e90e360786cbf1d9148cff8ffa9a13ae14')

package() {
  cd "Goneovim-$pkgver-linux"
  install -Dm 755 "${_pkgname}" -t "$pkgdir/usr/bin/"
}
