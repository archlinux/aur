# Maintainer: Nathan Monfils <nathan.monfils@hotmail.fr>

pkgname=fortune-mod-doctorwho-classic-series
pkgver=1.1
pkgrel=1
pkgdesc="Doctor who classic series (1963-1989) fortune cookie file"
url="https://tvtropes.org/pmwiki/pmwiki.php/Quotes/DoctorWhoClassicSeriesDoctors"
arch=('any')
license=('unknown')
depends=('fortune-mod')
groups=('fortune-mods')
source=(doctorwho-classic-series)
md5sums=('5a4bd9c1b7a7ca657ad5240a999b5eb5')

build() {
  cd "$srcdir"
  strfile doctorwho-classic-series doctorwho-classic-series.dat
}

package () {
  install -D -m644 doctorwho-classic-series $pkgdir/usr/share/fortune/doctorwho-classic-series
  install -D -m644 doctorwho-classic-series.dat $pkgdir/usr/share/fortune/doctorwho-classic-series.dat
}
