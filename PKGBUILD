# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=gpx2svg-git
_pkgname=gpx2svg
pkgver=r11.47d2251
pkgrel=1
pkgdesc="Python script to convert GPX data to SVG"
arch=('any')
url="https://nasauber.de/opensource/gpx2svg/"
license=('GPL3')
depends=('python')
conflicts=('gpx2svg')
source=("${_pkgname}"::'git://git.l3u.de/gpx2svg.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  install -Dm755 $srcdir/${_pkgname}/gpx2svg "${pkgdir}/usr/bin/gpx2svg"
}
