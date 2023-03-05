# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=erdtree-bin
pkgver=1.2.0
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
sha256sums_x86_64=('837f1e29af9c1971fd0f7ee08fe16ca47e77b9622c2960e9b568f6b5fbe20458')
sha256sums_aarch64=('4f1375b893095f26e295c442dd4f0c6441892174b353235468f36383438f3e7f')
validpgpkeys=()

package() {
	install -Dm755 et -t $pkgdir/usr/bin/
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/
}
