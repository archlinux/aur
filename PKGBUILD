# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync-nemo
pkgver=1.3.12.36116
pkgrel=1
pkgdesc="Nemo integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "nemo-python")
makedepends=('gtk-doc')
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}-precise_all.deb")
sha256sums=('e3b9ac6be0a2f0488aea05753c37b271763cc2f145ff860f5615a79bf2dc2113')

package() {
  tar -zxf "${srcdir}"/data.tar.gz -C "${pkgdir}"
}
