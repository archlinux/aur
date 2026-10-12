# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Previous maintainer: Yochai Gal <yochai gal at gmail dot com>

pkgname=insync-thunar
pkgver=3.9.5.60024
pkgrel=1
pkgdesc="Thunar integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=(
	'insync'
	'thunar'
	'thunarx-python'
)
source=("https://apt.insync.io/ubuntu/pool/contrib/i/${pkgname}/${pkgname}_${pkgver}_all.deb")
sha256sums=('9c029ce467bf76c87c8d5e28529701a67c80ad3c15c18ada3acf79c5ce376d03')

package() {
   tar xf data.tar.gz
   cp -a usr "${pkgdir}"
}
