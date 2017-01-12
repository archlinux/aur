# Contributor: 100best

pkgname=openspades-font-unifont
pkgver=unknown
pkgrel=2
pkgdesc="GNU Unifont (Generic Unicode Font) for OpenSpades."
url="http://openspades.yvt.jp"
arch=('any')
license=('GPL')
depends=('openspades')
source=('https://yvt.jp/files/programs/osppaks/font-unifont.pak')
md5sums=('bd5025c83aacd4bddc52980b30d77453')

package() {
  mkdir -p $pkgdir/usr/share/openspades/Resources
  cp font-unifont.pak $pkgdir/usr/share/openspades/Resources 
}
