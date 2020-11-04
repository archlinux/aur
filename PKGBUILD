# Maintainer: Patrick Wicki <patrick.wicki96 at gmail dot com>

pkgname=barify
pkgver=1.0.0
pkgrel=1
pkgdesc='Modify volume or brightness and display result as a bar via notifications'
arch=(any)
url="https://github.com/arctize/barify"
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
license=(GPL3)
depends=(git notification-daemon)
optdepends=('dunst: for notifications on Xorg'
            'mako: for notifications on Wayland')
sha256sums=('da73176c23f10f255a10a74312e035e49f079edc59d1c45b91340c05cd87aeb7')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 barify ${pkgdir}/usr/bin/barify
}
