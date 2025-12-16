pkgname=rtimelogger
pkgver=0.8.0
pkgrel=1
pkgdesc="Rust program to track working hours and calculate surplus using SQLite"
arch=("x86_64")
url="https://github.com/umpire274/rtimelogger"
license=("MIT")

source=(
	"rtimelogger-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/umpire274/rtimelogger/releases/download/v${pkgver}/rtimelogger-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
)

sha256sums=(
	"443867ecb9f29fefc359729c593fd0a99ab707c41deba20c7b59be22b56d8103"
)

package() {
	install -Dm755 rtimelogger "${pkgdir}/usr/bin/rtimelogger"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/rtimelogger/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/rtimelogger/README.md"
	install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/rtimelogger/CHANGELOG.md"
}
