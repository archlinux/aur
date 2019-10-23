# Maintainer: lans9831@gmail.com
_pkgname=gonvim
pkgname=gonvim-fork
pkgver=0.3.5
pkgrel=1
pkgdesc="Neovim GUI written in Golang - fork for the purpose of maintenance and enhancement"
arch=('any')
url="https://github.com/akiyosi/gonvim"
license=('mit')
depends=('neovim' 'qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-svg' 'qt5-declarative' 'qt5-webchannel' 'qt5-webengine')
provides=("${_pkgname}")
conflicts=("gonvim")
source=("https://github.com/akiyosi/gonvim/releases/download/v$pkgver/Gonvim-$pkgver-linux.tar.gz")
sha256sums=('e635a9897be4c7766fe6b9016d90d5779119713d7bb8aaad1973ffab9747e954')

package() {
  cd "Gonvim-$pkgver-linux"
  install -Dm 755 "${_pkgname}" -t "$pkgdir/usr/bin/"
}
