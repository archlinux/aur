pkgname=rbackup
pkgver=0.6.1
pkgrel=1
pkgdesc="Fast incremental backup tool written in Rust"
arch=("x86_64")
url="https://github.com/umpire274/rbackup"
license=("MIT")

source=(
	"rbackup-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/umpire274/rbackup/releases/download/v${pkgver}/rbackup-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)

sha256sums=(
	"f253bbec68fd3fe9f9531dac22a500639094c6847a65d8640bb89c7605dbb3ce"
)

package() {
	install -Dm755 rbackup "${pkgdir}/usr/bin/rbackup"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/rbackup/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/rbackup/README.md"
	install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/rbackup/CHANGELOG.md"
}