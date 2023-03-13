# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=erdtree-bin
pkgver=1.4.1
pkgrel=1
epoch=
pkgdesc="A multi-threaded file-tree visualizer and disk usage analyzer."
arch=('x86_64' 'aarch64')
url="https://github.com/solidiquis/erdtree/"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(et) # rename to erdtree to avoid conflict with wps excel :(
conflicts=(erdtree)
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("$pkgname-x86_64-$pkgver-$pkgrel.tar.gz::https://github.com/solidiquis/erdtree/releases/download/v$pkgver/et-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-aarch64-$pkgver-$pkgrel.tar.gz::https://github.com/solidiquis/erdtree/releases/download/v$pkgver/et-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
noextract=()
sha256sums_x86_64=('b9421127d0fc0f53ed049d0b27f9304c2efa59ceb33601a9ef1aadae7ca85f2c')
sha256sums_aarch64=('9ecd1d285da18f41d5f1db6a440f1174f78f5bad3de28e7e101d21d3e4d2326b')
validpgpkeys=()

package() {
	install -Dm755 et -t $pkgdir/usr/bin/
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${pkgname}/
  install -Dm644 README.md CHANGELOG.md -t $pkgdir/usr/share/doc/$pkgname/
}
