# Maintainer: Patrick Wicki <patrick.wicki96 at gmail dot com>

pkgname=barify
pkgver=1.2
pkgrel=1
pkgdesc='Adjust volume/brightness and display result as a bar via notifications'
arch=(any)
url="https://github.com/arctize/barify"
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
license=(GPL3)
depends=(git notification-daemon)
optdepends=('dunst: for notifications on Xorg'
            'mako: for notifications on Wayland')
sha256sums=('05c5dbd45707d6e9f22396f72bbb0b77ea93c731b6c4517a37e4930dbf48df2e')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 barify ${pkgdir}/usr/bin/barify
}
