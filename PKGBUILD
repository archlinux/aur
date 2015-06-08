# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

pkgname=bmagic
pkgver=3.7.0
pkgrel=3
pkgdesc="C++ template library for efficient platform independent bitsets"
arch=(i686 x86_64)
license=(GPL)
url=(https://packages.debian.org/en/sid/libdevel/bmagic)
sha256sums=(3b6d7854ac914e51811ee47b6acc307c5591f64a484cfd79ff9c83ccd0e2a9e7)

source=(http://ftp.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}-${pkgrel}_all.deb)

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}
