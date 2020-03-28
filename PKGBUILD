# Maintainer: Oliver Gondža <ogondza@gmail.com>
# Contributor: Oliver Gondža <ogondza@gmail.com>
pkgname=dumpling
pkgver=2.4
pkgrel=2
epoch=0
pkgdesc="Automation friendly java threaddump analyzer"
arch=('any')
url="https://olivergondza.github.io/dumpling/"
license=('MIT')
groups=()
depends=('java-runtime')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "https://repo.maven.apache.org/maven2/com/github/olivergondza/dumpling/dumpling-cli/$pkgver/dumpling-cli-$pkgver-shaded.jar"
)
noextract=("dumpling-cli-$pkgver-shaded.jar")
md5sums=('941a061edd71b1be9ac7ee708df0df53')
validpgpkeys=()

package() {
  install -D -m 644 "dumpling-cli-$pkgver-shaded.jar" "$pkgdir/var/lib/dumpling/dumpling.jar"
  install -D -m 755 "../dumpling" "$pkgdir/usr/bin/dumpling"
}
