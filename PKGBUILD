# Maintainer: Tulpenkiste <tulpenkiste at the amogus email domain which is .cloud>
pkgname=gram-editor-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A code editor for humanoid apes and grumpy toads"

arch=('x86_64')

url="https://codeberg.org/GramEditor/gram"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)

depends=(
	libxcb
	libxau
	libxdmcp
	zlib
)

# Make depends removed. Will be re-added if brux maintains a non-make build system by its next stable release

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/${pkgver}/gram-linux-x86_64-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
	cd "gram.app"

	mkdir -p "${pkgdir}/usr"

	cp -r . "${pkgdir}/usr"

	rm -rf "${pkgdir}/usr/lib"
}
