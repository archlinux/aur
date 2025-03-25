# Maintainer: Matthew Chisolm <active.hope9695@sow.care>
pkgname=expo-orbit-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Accelerate your development workflow with one-click build launches and simulator management"
arch=("x86_64")
url="https://github.com/mchisolm0/orbit.git"
license=('MIT')
depends=()
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
optdepends=()
source=(https://github.com/expo/orbit/releases/download/expo-orbit-v2.0.2/expo-orbit-2.0.2-1.x86_64.rpm)

sha256sums=('5dc31bdd1f47c94f142ef94e2bd9e23e50be6fe9893fb64776b5e0c52cadba9c')

package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
