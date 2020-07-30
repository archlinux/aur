# Maintainer: Mounir Erhili <mounirerhili@gmail.com>
# Previous maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Zhengyu Xu <xzy3186@gmail.com>
pkgname=insync-nemo-git
pkgver=3.1.4.40795
pkgrel=2
pkgdesc="Nemo integration for insync"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip)
arch=('any')
depends=("insync" "nemo-python")
source=("insync-nemo-${pkgver}.deb::http://s.insynchq.com/builds/insync-nemo_${pkgver}_all.deb")
sha256sums=('d4a6c6d6641e1d4571a9b255836f18caf30106cc3c16a028a3afe0cc358eea54')
package() {
  cd "${srcdir}"
  tar -zxf data.tar.gz
  cp -r usr "${pkgdir}"
}
