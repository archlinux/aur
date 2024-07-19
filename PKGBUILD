# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.4.5
pkgrel=0
pkgdesc="A minimal command line reader offering better readability of web pages on the CLI."
arch=('i686' 'x86_64') #'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mrusme/reader"
license=('GPL-3.0')
provides=('reader')
conflicts=('reader')
source=("https://raw.githubusercontent.com/mrusme/reader/v${pkgver}/LICENSE"
	"https://raw.githubusercontent.com/mrusme/reader/v${pkgver}/README.md")
source_i686=("reader_${pkgver}_i686.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_386.tar.gz")
source_x86_64=("reader_${pkgver}_x86_64.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_amd64.tar.gz")
#source_armv6h=("reader_${pkgver}_armv6h.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_armv6.tar.gz")
#source_armv7h=("reader_${pkgver}_armv7h.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_armv7.tar.gz")
#source_aarch64=("reader_${pkgver}_aarch64.tar.gz::https://github.com/mrusme/reader/releases/download/v${pkgver}/reader_${pkgver}_linux_arm64.tar.gz")
sha256sums=(SKIP
            SKIP)
sha256sums_i686=('54693382007bdc5c4bc81f5e5cdf33a31b5625dd8bc45c553a9c6197b5b91404')
sha256sums_x86_64=('e5a74d0584a14602d8339c6d6121de1177efeb297b201bae442e9621d542c99e')
#sha256sums_armv6h=('2e8a2dcae02ca97f4bee13a2fa556f2fb1a513569cfd1c5a329c2a449a3f745a')
#sha256sums_armv7h=('e5d8b1d8486bb7ae8fbb8fd863f2e56d8a35c71b9da64595cf300ee835073224')
#sha256sums_aarch64=('b048b2a54627e87c26a0e293c68e563b3552fe041c60139508054ab0f956d714')

package() {
  install -D -m755 reader "${pkgdir}/usr/bin/reader"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
