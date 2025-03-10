pkgname=expo-orbit
pkgver=2.0.2
pkgrel=1
pkgdesc="Accelerate your development workflow with one-click build launches and simulator management"
arch=("x86_64")

depends=()
optdepends=()
source=(https://github.com/expo/orbit/releases/download/expo-orbit-v2.0.2/expo-orbit-2.0.2-1.x86_64.rpm)

sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
  pwd
  echo "src dir is $srcdir and pkg dir is $pkgdir"
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
