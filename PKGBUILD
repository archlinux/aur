# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.4.0
pkgrel=0
pkgdesc="A minimal command line reader offering better readability of web pages on the CLI."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mrusme/reader"
license=('GPL-3.0')
provides=('reader')
conflicts=('reader')
source=("https://raw.githubusercontent.com/mrusme/reader/v$pkgver/LICENSE"
	"https://raw.githubusercontent.com/mrusme/reader/v$pkgver/README.md")
source_i686=("reader_i686.tar.gz::https://github.com/mrusme/reader/releases/download/v$pkgver/reader_${pkgver}_linux_386.tar.gz")
source_x86_64=("reader_x86_64.tar.gz::https://github.com/mrusme/reader/releases/download/v$pkgver/reader_${pkgver}_linux_amd64.tar.gz")
source_armv6h=("reader_armv6h.tar.gz::https://github.com/mrusme/reader/releases/download/v$pkgver/reader_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("reader_armv7h.tar.gz::https://github.com/mrusme/reader/releases/download/v$pkgver/reader_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("reader_aarch64.tar.gz::https://github.com/mrusme/reader/releases/download/v$pkgver/reader_${pkgver}_linux_arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '491d74640b70db52ebc06508a92bbeb9b5a3c2c01842a615490aef9ae1a21bf3')
sha256sums_i686=('071a2ce48647922634276d7fe190782c65c7b721060ce74ca6837071182c8147')
sha256sums_x86_64=('ad41ffe0b7b0fb197f5ec9b3f5acd7332e1db994822d415ea433f0585e5c44b2')
sha256sums_armv6h=('efb7955a08ad16585be5dde24c602c0a1c2f31d5df61a096255d25f9ac8e8435')
sha256sums_armv7h=('56fbbc1bbaa4650b05dfc3f34af975c9d8f832f3ff253dce50d405e3ee60b2ed')
sha256sums_aarch64=('1bfdc21ecb36803de33b024e838dea74bd5b6c6783efa9275278352b17a5c48d')

package() {
  install -D -m755 reader "$pkgdir/usr/bin/reader"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
