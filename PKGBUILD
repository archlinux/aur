pkgname=httpclient-bin
pkgver=1.0.42
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('e6c7c39648606816e4d903f6731e9629ee21a8bdb05b74050fc8047d82807b73')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
