# Maintainer: Manuel Jenny <git@manueljenny.ch>
# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Previous maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>
pkgname=insync-nemo
pkgver=3.7.9.50368
pkgrel=1
pkgdesc="Nemo integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "nemo-python")
source=("${pkgname}-${pkgver}.deb::https://cdn.insynchq.com/builds/linux/${pkgname}_${pkgver}_all.deb")
sha256sums=('786ec8f9ce40dfa43408be5e5f7fdb7f8c09ce7d11fb4b818cae390ec18da354')
package() {
  cd "${srcdir}"
  tar -zxf data.tar.gz
  cp -r usr "${pkgdir}"
}
