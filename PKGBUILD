pkgname=httpclient-bin
pkgver=1.0.39
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('3a5c23c5d25649d3ba1f8048e754034ef11b13af7eac60e3daf10abce1cb6a71')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
