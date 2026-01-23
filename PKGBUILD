pkgname=httpclient-bin
pkgver=1.0.35
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('c54531c3724c956ffc4f288d16abbcd9e05c3b028bd718ca90cc580781418bb5')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
