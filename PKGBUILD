pkgname=httpclient-bin
pkgver=1.0.40
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('15f2a4ed4d6b12728c9baf14a156d116191d9bc6403f33f6e8a4e1d23001bfa2')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
