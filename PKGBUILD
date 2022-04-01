# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.1.3
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
            '5a77f62176bab5c7067b01a23dd67554fe0b016315a922c08ac912867e60ec10')
sha256sums_i686=('d9bb4fe94e9708070610b0051fbc231a4c86245b60e4faf222f008379a56f418')
sha256sums_x86_64=('2e98625c1fb4f6b2e92641a538530b32e9beb37280b695fb5c112fb7d429e74c')
sha256sums_armv6h=('98bc65d65eb1261bc56e211dd0f4c6cbe6a298b6b44ed0150993e19e89b5bb06')
sha256sums_armv7h=('26aca053b513fe8b0bdeaa591faaebfd0f1f2e889dd8aec7f4b38423042fd83b')
sha256sums_aarch64=('5876c2d311cc7508ac046902bb7352c3b000bdd40c7a0a0a0e15c73dce19d6a0')

package() {
  install -D -m755 reader "$pkgdir/usr/bin/reader"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
