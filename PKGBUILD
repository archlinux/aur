# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=fortune-mod-doctorwho-new-series
pkgver=11.0
pkgrel=1
pkgdesc="Doctor who new series (2005-present) fortune cookie file"
url="https://tvtropes.org/pmwiki/pmwiki.php/Quotes/DoctorWhoNewSeriesDoctors"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=(doctorwho-new-series)
md5sums=('5cc052eeca8fb6654bc2634cc2b4c9cb')

build() {
  cd "$srcdir"
  strfile doctorwho-new-series doctorwho-new-series.dat
}

package () {
  install -D -m644 doctorwho-new-series $pkgdir/usr/share/fortune/doctorwho-new-series
  install -D -m644 doctorwho-new-series.dat $pkgdir/usr/share/fortune/doctorwho-new-series.dat
}
