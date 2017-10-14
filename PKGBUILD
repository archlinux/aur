# Maintainer: loh.tar <loh.tar at googlemail dot com>
pkgname='dupfi'
pkgver='0.1'
pkgrel='1'
pkgdesc='Duplicate Finder - A pure shell script to find identical files across your drives'
arch=('any')
url='https://github.com/loh-tar/dupfi'
license=('GPL')
depends=('dash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('23ba8c51896fa29461143d204719f56b')

package() {
  cd "$pkgname-$pkgver"
  install -pDm755 -t $pkgdir/usr/bin dupfi
}
