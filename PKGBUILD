pkgname=httpclient-bin
pkgver=1.0.44
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('ec540f93a61b26183aa58b20b4dd2f869a679bc55acb84c9e8040c22d23ca0c2')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
