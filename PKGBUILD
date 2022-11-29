# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Previous maintainer: Erik Dubois <erik.dubois@gmail.com>
# Previous maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-caja
pkgver=3.7.9.50368
pkgrel=1
pkgdesc="Caja integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=(
	'caja'
	'insync'
	'insync-emblem-icons'
	'python-caja'
)
source=("https://apt.insync.io/ubuntu/pool/contrib/i/${pkgname}/${pkgname}_${pkgver}_all.deb")
sha256sums=('b2fce7ec636b683d65056eeaa48cd5484492627a4541492376dedd945ef23ce8')

package() {
   tar xf data.tar.gz
   cp -a usr "${pkgdir}"
}
