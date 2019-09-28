# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Previous Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>
pkgname=insync-nemo
pkgver=3.0.13.40201
pkgrel=1
pkgdesc="Nemo integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=('d351325a29b54f74b4c8e68589ff75946684be163e9d469cc999a3c4d2d4c3ad')
package() {
  cd "${srcdir}"
  tar -zxf data.tar.gz
  cp -r usr "${pkgdir}"
}
