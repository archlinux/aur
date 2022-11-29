# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Previous maintainer: Yochai Gal <yochai gal at gmail dot com>

pkgname=insync-thunar
pkgver=3.7.9.50368
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
sha256sums=('5fbd42bbd6ac714bcb9a9495c1fa0873e8cbfe7f58fc15ee5aa45dc625174159')

package() {
   tar xf data.tar.gz
   cp -a usr "${pkgdir}"
}
