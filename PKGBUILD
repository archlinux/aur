# Maintainer: Jake Leahy <jake (at) leahy (dot) dev

pkgname=slint-cpp-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Slint is a toolkit to efficiently develop fluid graphical user interfaces for any display: embedded devices and desktop applications"
arch=("x86_64")
url="https://slint-ui.com"
license=("GPL3")
source=("slint-cpp-$pkgver.tar.gz::https://github.com/slint-ui/slint/releases/download/v$pkgver/Slint-cpp-$pkgver-Linux-$CARCH.tar.gz")
sha256sums=('2ed1dcb4a460e9df84cad13f0dc03803bfc89e99e3c0a34a69f3f40a54db53f7')
depends=("freetype2" "qt5-base")
provides=("slint-cpp")
conflicts=("slint-cpp")


package() {
  cd Slint-cpp-$pkgver-Linux-$CARCH/
  mkdir -p ${pkgdir}/usr/
  cp -r . ${pkgdir}/usr/
}
