# Maintainer: Zesko
pkgname=journalctl-desktop-notification
pkgver=1.0.0
pkgrel=1
pkgdesc="It notifies you on the desktop when an error message appears in Journalctl log."
arch=('any')
url="https://gitlab.com/Zesko/journalctl-desktop-notification"
license=('GPL3')
depends=('dunst' 'systemd')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=('git+https://gitlab.com/Zesko/journalctl-desktop-notification.git')
sha256sums=('SKIP')

package() {
  cd "$srcdir/${pkgname}"
  cp -vr usr etc "$pkgdir"
}
