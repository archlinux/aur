pkgname=httpclient-bin
pkgver=1.0.41
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('26a98c0eb37da07ef8aafa7cad0463781665e54b0759614c8dc7fd5182c58ba7')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
