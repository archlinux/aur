# Maintainer: Haron Prime (Haron_Prime) <haron.prime@gmx.com>

pkgname=gis-weather
pkgver=0.8.0
pkgrel=1
pkgdesc="Customizable weather widget"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gis-weather"
license=('GPLv3')
groups=()
depends=('gtk3' 'python' 'python-gobject' 'python-cairo')
optdepends=('librsvg')
provides=()
conflicts=('gis-weather-git')

source=(${url}/files/gis-weather/${pkgver}/gis-weather_${pkgver}_all.deb/download)
md5sums=('a537781f344b396db8375a7a8aa41e17')

package() {
  cd "$srcdir"
  tar -xf data.tar.xz -C "${pkgdir}"
  echo "aur" > "${pkgdir}/usr/share/${pkgname}/package"
  chmod -R 777 "${pkgdir}"/usr/share/${pkgname}
  mkdir -p $pkgdir/usr/bin
}
