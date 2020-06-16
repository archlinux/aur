# Maintainer: whriedplanck

pkgname=g17-star-database-mag17-astap
pkgver=20190906
pkgrel=1
pkgdesc="For the internal astrometric solver of astap. Contains 105 million stars up to magnitude 17."
arch=('i686' 'x86_64')
url="http://www.hnsky.org/astap.htm"
license=('GPL')
depends=('astap-bin')
source=("https://astuteinternet.dl.sourceforge.net/project/astap-program/star_databases/g17_star_database_mag17_astap.deb")
sha1sums=('94a896595ef874f13e0805107892379375591fe4')

#build() {
#  if [[ "$CARCH" == "i686" ]]; then
#    ar x "${_pkgname}_i386.deb"
#  else
#    ar x "${_pkgname}_amd64.deb"
#  fi
#}

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  cd "${pkgdir}"
  chmod 755 opt/
}
