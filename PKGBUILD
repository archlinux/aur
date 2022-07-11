# Maintainer: Manuel Jenny <git@manueljenny.ch>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Previous maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>
pkgname=insync-nemo
pkgver=3.4.2.40983
pkgrel=1
pkgdesc="Nemo integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "nemo-python")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=('5fc843812d4e866107aaf3423dc3e2f3ecc478c7ef72ca2b9d7b03e46dec38a4')
package() {
  cd "${srcdir}"
  tar -zxf data.tar.gz
  cp -r usr "${pkgdir}"
}
