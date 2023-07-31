# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.4.2
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
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '491d74640b70db52ebc06508a92bbeb9b5a3c2c01842a615490aef9ae1a21bf3')
sha256sums_i686=('0172b2d01739dad387df8c48b7364829baafab208825ca9ecfc9258005d5a590')
sha256sums_x86_64=('0833213336e5e402cf65a1a916a3c6003bacb5e7c82b4d740f9f6c8953520531')
sha256sums_armv6h=('c6b18c7f66cd832815954b177b7e0adc611bdce59414170d7338288e0a98a0ee')
sha256sums_armv7h=('7a546c95b948b88a106b17419c3772af1b571420ca4197e6ba17d28aef92c0de')
sha256sums_aarch64=('0c4d59f1bd520d3861959019c4a34c1892d180de2a3df229b80e34d93e0a257c')

package() {
  install -D -m755 reader "${pkgdir}/usr/bin/reader"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
