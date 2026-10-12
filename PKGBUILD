# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Previous maintainer: Erik Dubois <erik.dubois@gmail.com>
# Previous maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-caja
pkgver=3.9.5.60024
pkgrel=1
pkgdesc="Caja integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=(
	'caja'
	'insync'
	'python-caja'
)
source=("https://apt.insync.io/ubuntu/pool/contrib/i/${pkgname}/${pkgname}_${pkgver}_all.deb")
sha256sums=('cbbe0d56e97158388209d3f52a96170a2a9b0cebc72527c58b79a405222eef4d')

package() {
   tar xf data.tar.gz
   cp -a usr "${pkgdir}"
}
