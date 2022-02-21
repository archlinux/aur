# Maintainer: Marius Iacob <themariusus at gmail dot com>

pkgname=reader-bin
pkgver=0.1.2
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
            '8083a507de01c46a7832215f99edd068f3c21b8cc31b01d0e0bb0525f127617c')
sha256sums_i686=('90bd1cb40ef26189a7a43db1eee49c84ead5c211120a8011f0534c16ca659483')
sha256sums_x86_64=('9431ad5ee02db01098a61ca410bb7caa0cec4df144f33491dea100634e6c4a9c')
sha256sums_armv6h=('b2e2dcf9d5449dbcd2dcfeb2fbfd8b90c255a55ae85a8d2b0df3814645336a87')
sha256sums_armv7h=('d75daeb659a258073c1221911d619d587250713bd6d7f138c037db9e9ded9155')
sha256sums_aarch64=('d862c4ac1c6dc312de9407c000571725649ffd44f100b36b58ed88b6b08f9436')

package() {
  install -D -m755 reader "$pkgdir/usr/bin/reader"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
