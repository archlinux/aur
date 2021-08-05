# Maintainer: Manuel Jenny <git@manueljenny.ch>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Previous maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>
pkgname=insync-nemo
pkgver=3.4.0.40973
pkgrel=1
pkgdesc="Nemo integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "nemo-python")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=('ec9035334ee82980f89b93419a0b044c9b8271bca8266d80f6c96dcbf8be338b')
package() {
  cd "${srcdir}"
  tar -zxf data.tar.gz
  cp -r usr "${pkgdir}"
}
