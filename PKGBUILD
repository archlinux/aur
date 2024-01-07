# Maintainer: Nikolas P <nikodemus.p@gmx.at>

pkgname=virtualgps
pkgver=1.2.0
pkgrel=1
pkgdesc="Virtual GPS simulates GPS receiver available on pseudo terminal"
url="https://github.com/rkaczorek/virtualgps"
license=(GPL3)
arch=(i686 x86_64)
depends=('gpsd' 'python')

source=("https://github.com/nikodemusP/virtualgps/archive/refs/tags/v1.2.0.tar.gz")
sha256sums=("dce53b9cd330c0a36b50e0bb00affdc719bab243f251f4bb46366b4e295dccf8")


package() {
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/systemd/system/
  mkdir -p $pkgdir/etc
  cd virtualgps-1.2.0
  cp virtualgps.py      $pkgdir/usr/bin/
  cp virtualgps.service $pkgdir/usr/lib/systemd/system/
  cp location.conf      $pkgdir/etc/
}
