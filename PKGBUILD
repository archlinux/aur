pkgname=httpclient-bin
pkgver=1.0.38
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('5391108675dea7e0957536be0a199225fb117ae2d70da45937da7571f4d56066')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
