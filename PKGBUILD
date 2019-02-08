# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=fortune-mod-doctorwho-new-series
pkgver=11.1
pkgrel=1
pkgdesc="Doctor who new series (2005-present) fortune cookie file"
url="https://tvtropes.org/pmwiki/pmwiki.php/Quotes/DoctorWhoNewSeriesDoctors"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=(doctorwho-new-series)
md5sums=('499e9f7e6d6b5f2cb8bec79cf2996f8c')

build() {
  cd "$srcdir"
  strfile doctorwho-new-series doctorwho-new-series.dat
}

package () {
  install -D -m644 doctorwho-new-series $pkgdir/usr/share/fortune/doctorwho-new-series
  install -D -m644 doctorwho-new-series.dat $pkgdir/usr/share/fortune/doctorwho-new-series.dat
}
