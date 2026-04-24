# Maintainer: Jake Leahy <jake (at) leahy (dot) dev

pkgname=slint-cpp-bin
pkgver=1.16.1
pkgrel=1
pkgdesc="Slint is a toolkit to efficiently develop fluid graphical user interfaces for any display: embedded devices and desktop applications"
arch=("x86_64")
url="https://slint-ui.com"
license=("GPL3")
source=("slint-cpp-$pkgver.tar.gz::https://github.com/slint-ui/slint/releases/download/v$pkgver/Slint-cpp-$pkgver-Linux-$CARCH.tar.gz")
sha256sums=('125dd01e579c041f80dab0b92522a027b99d7cee47b5c005d6291f4cca639715')
depends=("freetype2" "qt5-base")
provides=("slint-cpp")
conflicts=("slint-cpp")


package() {
  cd Slint-cpp-$pkgver-Linux-$CARCH/
  mkdir -p ${pkgdir}/usr/
  cp -r . ${pkgdir}/usr/
}
