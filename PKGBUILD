# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.1.4
pkgrel=1
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
            'd03fd78f8efbc4587ffd5c8b6bd3dd7e88e8526737b25c47e29238d0c8009344')
sha256sums_i686=('2e6948e3b957be93185d32de904cc8bd4183fa67b8636978b3d6e89066224833')
sha256sums_x86_64=('34886adce0226dfd3d0a8c052fe94427e9f99eb44b24fb76a34a15b30699f79f')
sha256sums_armv6h=('8d5c062808fe3d5871993bb48fb65e9bd7d72e2cb7b4102fe71e33fbe7f5e6df')
sha256sums_armv7h=('f6ebdc2d406aaf716285556b0b1de46c63eb0777d314a615246dac5052264367')
sha256sums_aarch64=('423aec8d88d360e23b3804fc5c7f32194c46aa9719576f0e728521c67a021b7c')

package() {
  install -D -m755 reader "$pkgdir/usr/bin/reader"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
