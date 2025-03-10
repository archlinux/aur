pkgname=expo-orbit
pkgver=2.0.2
pkgrel=1
pkgdesc="Accelerate your development workflow with one-click build launches and simulator management"
arch=("x86_64")

makedepends=("make" "rpm-tools")
optdepends=()
source=("https://github.com/expo/orbit/archive/refs/tags/$pkgname-v$pkgver.tar.gz")

sha256sums=('SKIP')

package() {
  pwd
  ls
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
  ls -l expo-orbit
}
