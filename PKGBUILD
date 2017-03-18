# Maintainer: Thomas "Ventto" Venriès <thomas.venries@gmail.com>

pkgname=batify
pkgver=1.0
pkgrel=1
pkgdesc='Udevrule to display plug and battery level notifications (multi-x sessions).'
arch=('any')
url="https://github.com/Ventto/${pkgname}.git"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('libnotify' 'xpub')
optdepends=('notification-daemon')
source=("https://github.com/Ventto/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm644 99-${pkgname}.rules ${pkgdir}/etc/udev/rules.d/99-${pkgname}.rules
}
