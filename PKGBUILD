pkgname=httpclient-bin
pkgver=1.0.43
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('a966856c84bbd934baa0ad24aa4828daca1d70984123d78ad9475529da8d202d')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
