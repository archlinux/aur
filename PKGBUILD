# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.6.0
pkgrel=0
pkgdesc="A minimal command line reader offering better readability of web pages on the CLI."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mrusme/reader"
license=('GPL-3.0')
provides=('reader')
conflicts=('reader')
source=("https://raw.githubusercontent.com/mrusme/reader/v${pkgver}/LICENSE"
	"https://raw.githubusercontent.com/mrusme/reader/v${pkgver}/README.md")
source_i686=("reader_${pkgver}_i686.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_386.tar.gz")
source_x86_64=("reader_${pkgver}_x86_64.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("reader_${pkgver}_armv6h.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("reader_${pkgver}_armv7h.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("reader_${pkgver}_aarch64.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_arm64.tar.gz")
sha256sums=(SKIP
            SKIP)
sha256sums_i686=('1f19030a8685e0ce64d80537131b8b3e213a89353008fd8937580eab69695088')
sha256sums_x86_64=('dd1af76325b237c28241344a89585acddc4e0dd4446b71c1d669354074c57258')
sha256sums_armv6h=('11abfcae3a9f73d37bd703543c43d46b317e7ade50697172e850a9ab9a7a4def')
sha256sums_armv7h=('f9a9f155f312496a064b4ce8b59e7e2a35ff8c5f059dc128a3e466ea8b8f9a43')
sha256sums_aarch64=('dc02ccc91ab1580c0d3760ceaef839f370099076eb76c51f4148987dacb11f57')

package() {
  install -D -m755 reader "${pkgdir}/usr/bin/reader"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/reader/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/reader/README.md"
}
