# Maintainer: Polichronucci <nick at discloud dot eu>

pkgname=owncloud-app-ocsms
pkgver=1.9.0
pkgrel=1
pkgdesc="Push your Android SMS to your ownCloud instance."
arch=('any')
url="https://github.com/nerzhul/ocsms"
license=('AGPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nerzhul/ocsms/archive/v${pkgver}.tar.gz")
sha512sums=('ebecad9fa39d3427bb221b1cd76fdb1889050a3369ebf1bb53debd6974cdf93d9dc73853e927bbba73fbd0e49bee676ba32dda6230217c488dbc8578def402dc')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/ocsms-${pkgver}" "${pkgdir}/usr/share/webapps/owncloud/apps/ocsms"
}
