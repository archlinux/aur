# Maintainer: Evgenii Fedoseev

pkgname=qt-ads-git
pkgver=4.0.1
pkgrel=1
pkgdesc="Qt Advanced Docking System lets you create customizable layouts using a full featured window docking system similar to what is found in many popular integrated development environments (IDEs) such as Visual Studio."
arch=('x86_64')
url="https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System"
depends=('qt5-base')
license=("LGPL2.1")
source=("git+https://github.com/githubuser0xFFFF/Qt-Advanced-Docking-System")
sha512sums=('SKIP')

build() {
  cd "${srcdir}/Qt-Advanced-Docking-System"
  ls
  mkdir -p build
  cd build
  cmake ..
  cmake --build . --config Release
}

package() {
  cd "${srcdir}/Qt-Advanced-Docking-System/build"
  cmake --install . --prefix ${pkgdir}/usr
}

