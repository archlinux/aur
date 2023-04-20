# Maintainer: asukaminato <asukaminato at nyan dot eu dot org>
pkgname=erdtree-bin
pkgver=1.8.1
pkgrel=1
epoch=
pkgdesc="A multi-threaded file-tree visualizer and disk usage analyzer."
arch=('x86_64' 'aarch64')
url="https://github.com/solidiquis/erdtree/"
license=('MIT')
groups=()
depends=(glibc gcc-libs)
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
sha256sums_x86_64=('d1f9274791f518d19ec30c467d9da37e5d2c677f9359afecaa77e7fbe0dc8056')
sha256sums_aarch64=('5b3658e548d7d210a96a538888dcb26c343df61eafb546f244e03b1d2cb518e7')
validpgpkeys=()

package() {
	install -Dm755 et -t $pkgdir/usr/bin/
	install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/${pkgname}/
	install -Dm644 README.md CHANGELOG.md -t $pkgdir/usr/share/doc/$pkgname/
}
