pkgname=httpclient-bin
pkgver=1.0.45
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('87b8faaf23247e3fcee8a16dc4802e5a69ac2eb288f2feb2f444d8d9a6257392')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
