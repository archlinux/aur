pkgname=httpclient-bin
pkgver=1.0.36
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('19e72616c63331cde1b2c8a90b8810019d7389dfcf7052e5f2525a6c9918aabe')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
