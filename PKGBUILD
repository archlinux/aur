# Maintainer: Patrick Wicki <patrick.wicki96 at gmail dot com>

pkgname=barify
pkgver=1.1
pkgrel=1
pkgdesc='Modify volume or brightness and display result as a bar via notifications'
arch=(any)
url="https://github.com/arctize/barify"
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
license=(GPL3)
depends=(git notification-daemon)
optdepends=('dunst: for notifications on Xorg'
            'mako: for notifications on Wayland')
sha256sums=('ff83fe082833c346756a4fa9e77927f4f39f9538362304f04db9351291f22e53')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 barify ${pkgdir}/usr/bin/barify
}
