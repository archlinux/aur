pkgname=httpclient-bin
pkgver=1.0.32
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('6a5fe025069b23cdf4be190ecaf91569c5286c99fbc68919df260901ab632805')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
