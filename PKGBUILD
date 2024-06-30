# Maintainer: Zesko
pkgname=systemd-timer-notify
pkgver=1.0.0
pkgrel=1
pkgdesc="It notifies you on Desktop when systemd-service is started and processed, the notification will be closed automatically when systemd-service's process is done."
arch=('any')
url="https://gitlab.com/Zesko/systemd-timer-notify.git"
license=('GPL3')
depends=('python' 'dunst' 'systemd' 'openssh')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.conf")
source=('git+https://gitlab.com/Zesko/systemd-timer-notify.git')
sha256sums=('SKIP')

package() {
  cd "$srcdir/${pkgname}"
  cp -vr usr etc "$pkgdir"
}

