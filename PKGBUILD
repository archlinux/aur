# Maintainer: Zanny <lordzanny@gmail.com>

pkgname=open365
pkgver=1.0.0.112428
pkgrel=1
pkgdesc="The first open source cloud with LibreOffice online just in one click."
arch=(x86_64)
url="https://open365.io"
license=(custom)
depends=(seafile-shared python qt4)
source=("https://s3-eu-west-1.amazonaws.com/open365.io/downloads/$pkgname-client-$pkgver-17.deb")
sha256sums=('fce21e2217ddd6803d02451ff791d3eaff5ff471d0abf2c6ff0e4fd7ff9b4fa9')

package() {
    tar -xzC "$pkgdir" -f "$srcdir/data.tar.gz"
}
