pkgname=rfortune
pkgver=0.5.6
pkgrel=1
pkgdesc="Modern Rust implementation of the classic fortune program"
arch=("x86_64")
url="https://github.com/umpire274/rfortune"
license=("MIT")

source=(
	"rfortune-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/umpire274/rfortune/releases/download/v${pkgver}/rfortune-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)

sha256sums=(
	"c8414993cae845ba1394dca89eb3481de350a402345a71f49712a6c1bb32ea1f"
)

package() {
	install -Dm755 rfortune "${pkgdir}/usr/bin/rfortune"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/rfortune/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/rfortune/README.md"
	install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/rfortune/CHANGELOG.md"
}
