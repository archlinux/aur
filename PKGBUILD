# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=lite-xl-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="A lightweight text editor written in Lua"
arch=("x86_64")
url="https://github.com/lite-xl/lite-xl"
license=("MIT License")
provides=("lite-xl")
conflicts=("lite-xl" "lite-xl-git")
source=("lite-xl-$pkgver.tar.gz::$url/releases/download/v${pkgver}/lite-xl-linux-x86_64.tar.gz")
sha256sums=("70219d2caaf1e3aca3d4f278b0c8d08e9a7ae4c6ece2303e8f1cae9a7a35cc1f")

package() {
  cd lite-xl
  mkdir "${pkgdir}/usr"

  cp -R bin share "${pkgdir}/usr"
}
