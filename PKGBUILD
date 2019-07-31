# Maintainer: Salif Mehmed <salif@programmer.net>
pkgname=projstats
pkgver=1907.31.1
pkgrel=1
pkgdesc="Count source lines of code"
arch=("x86_64")
url="https://github.com/salifm/projstats"
license=("MIT")
depends=("jre11-openjdk")
source=("$pkgname-$pkgver-linux.zip::https://github.com/salifm/projstats/releases/download/v${pkgver}/projstats-v${pkgver}-linux.zip")
sha512sums=('7a79eaee8c11f37b8cedf70dfe2bf239da5da0deff1c52fc7611d0bb3b82bbc66a965fbfa46932614adc501bd2770f383b6728f1443464d91250364fb82cd7eb')
package() {
  cd "$pkgname-v$pkgver-linux"
  make DESTDIR="$pkgdir/" install
}
