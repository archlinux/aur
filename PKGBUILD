# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=erdtree-bin
pkgver=1.6.0
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
sha256sums_x86_64=('191713c05a08095a6f85e7828abd2837914a083c6cf6c5a90faabe10ce1cc9c7')
sha256sums_aarch64=('d2a5e2f37a152c532f2470904d828fef2033e013d9505f211cf21bdab5782fe5')
validpgpkeys=()

package() {
	install -Dm755 et -t $pkgdir/usr/bin/
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${pkgname}/
	install -Dm644 README.md CHANGELOG.md -t $pkgdir/usr/share/doc/$pkgname/
}
