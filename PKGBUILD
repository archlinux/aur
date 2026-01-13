pkgname=httpclient-bin
pkgver=1.0.33
pkgrel=1
arch=('x86_64')
depends=('libnss3' 'at-spi2-core' 'libasound2')
source=("https://github.com/FPKZ/HTTPClient/releases/download/v$pkgver/HTTPClient-$pkgver-linux.deb")
sha256sums=('c1191263e6e0fd31068addabb7d83af23e7fa0a6b3adb7e6bdee5afdaea6447e')
package() {
  tar -xzf data.tar.xz -C "${pkgdir}/"
}
