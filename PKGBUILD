pkgname=httpclient-bin
pkgver=1.0.46
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('9812082965b7ddc802a285cc519ce9bc2c22adc1611c1c6aa24f8d043f36409e')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
