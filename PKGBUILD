pkgname=expo-orbit
pkgver=2.0.2
pkgrel=2
pkgdesc="Accelerate your development workflow with one-click build launches and simulator management"
arch=("x86_64")

depends=()
optdepends=()
source=("expo-orbit-2.0.2-1.x86_64.rpm")

sha256sums=('SKIP')

package() {
  pwd
  echo "src dir is $srcdir and pkg dir is $pkgdir"
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
