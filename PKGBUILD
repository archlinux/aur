pkgname=httpclient-bin
pkgver=1.0.34
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('cff626276432b510320a1b453818a6bdc3211c6672011fdde3a734ebc7ac7874')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
