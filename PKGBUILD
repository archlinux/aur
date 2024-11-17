# Maintainer: badcast <lmecomposer@gmail.com>

pkgname=zeon-k98_pro-conffix
pkgver=1.0.0
pkgrel=1
pkgdesc="ZEON K98 or K98 Pro config fix [Fn] for driver"
arch=(any)
license=('GPLv3')
depends=('base')
source=("zeonk98_pro.conf")
sha256sums=('576f3eddbd002c0f8fe6548b7f9e864d57ad23f6f7bd1ef8b49f3c6f27a762d0')

package(){
   cd "${srcdir}/${_pkgbase}"
   install -Dm644 "${srcdir}/${source[0]}" -t "${pkgdir}/usr/lib/modprobe.d/"
}
