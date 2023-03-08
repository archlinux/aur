# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=erdtree-bin
pkgver=1.3.0
pkgrel=2
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
sha256sums_x86_64=('5615409272ab10c046dfd763cf061207c3f0b78bc817a6d3edcce816dcc75e85')
sha256sums_aarch64=('f60916f6a814b7bd44cc318d7fa15a14c6a9a4d3759aa6eb81dcf2bc60407b9d')
validpgpkeys=()

package() {
	install -Dm755 et -t $pkgdir/usr/bin/
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${pkgname}/
}
