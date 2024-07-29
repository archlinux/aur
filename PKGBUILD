# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.4.5
pkgrel=1
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
sha256sums_i686=('54693382007bdc5c4bc81f5e5cdf33a31b5625dd8bc45c553a9c6197b5b91404')
sha256sums_x86_64=('e5a74d0584a14602d8339c6d6121de1177efeb297b201bae442e9621d542c99e')
sha256sums_armv6h=('32e8d95ebcbb4e939f797fe67d008729fdd8ab892ca4d7292b22eb8b0f7eef3b')
sha256sums_armv7h=('9aba36acbf57110432dfcafd444622a27027b92d905f2e4bcc7eef14e8ec2df5')
sha256sums_aarch64=('ccaa8c64b8e2f4703fddacda097498c4da6ce92aabc5bf1da62253e5a654dcc0')

package() {
  install -D -m755 reader "${pkgdir}/usr/bin/reader"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
