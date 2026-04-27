pkgname=rnetbench
pkgver=0.2.0
pkgrel=1
pkgdesc="A modern, cross-platform network benchmarking tool (download, upload, latency, jitter) written in Rust."
arch=("x86_64")
url="https://github.com/umpire274/rnetbench"
license=("MIT")

source=(
	"rnetbench-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/umpire274/rnetbench/releases/download/v${pkgver}/rnetbench-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)

sha256sums=(
	"1da5ee982b2f4ee86c1a98fa92b2b2d7984224eb7de072d3d98da1f06f8b62dc"
)

package() {
	install -Dm755 rtimelogger "${pkgdir}/usr/bin/rnetbench"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/rtimelogger/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/rtimelogger/README.md"
	install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/rtimelogger/CHANGELOG.md"
}
