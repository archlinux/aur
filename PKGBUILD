# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.3.0
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
            'd03fd78f8efbc4587ffd5c8b6bd3dd7e88e8526737b25c47e29238d0c8009344')
sha256sums_i686=('976a54165d7e52cb1fd59b00f91d0b4d92eb713aa5bfc9b0becbb9cd0c98848e')
sha256sums_x86_64=('261ede87fd0ff7a94a447d4f4c0d88dfa8a9eb17b4abcfe45969fddb03fc112a')
sha256sums_armv6h=('386cd104265647ba7f90845c2e2a0c65b9f940827556021332672bef1247ae05')
sha256sums_armv7h=('3633587a0b8d4d3fe3576b73a9d1d5c5d9f1441e1e566762fc3a0f99713a18a4')
sha256sums_aarch64=('5d222ad846940c7e9af251157188f915e4869d8f5a78a43a7b5d97cd54a3d501')

package() {
  install -D -m755 reader "$pkgdir/usr/bin/reader"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
