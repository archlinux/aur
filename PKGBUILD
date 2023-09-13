# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.4.4
pkgrel=2
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
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'c6c9833af1f9d3fb7d38ef54c47fdef47146f0c6bc63dfaf08c44ff77f4b2384')
sha256sums_i686=('5e7ef88c583e80b2d78f6a26e8af89001ebd9bb2d2f0593ddc15b135132106f1')
sha256sums_x86_64=('2195d52e14715c741081fdecef7444c7a46ec168a180b935e76156dce520aa5a')
sha256sums_armv6h=('2e8a2dcae02ca97f4bee13a2fa556f2fb1a513569cfd1c5a329c2a449a3f745a')
sha256sums_armv7h=('e5d8b1d8486bb7ae8fbb8fd863f2e56d8a35c71b9da64595cf300ee835073224')
sha256sums_aarch64=('b048b2a54627e87c26a0e293c68e563b3552fe041c60139508054ab0f956d714')

package() {
  install -D -m755 reader "${pkgdir}/usr/bin/reader"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
