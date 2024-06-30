# Maintainer: Zesko
pkgname=btrfs-desktop-notification
pkgver=1.0.0
pkgrel=1
pkgdesc="It notifies you on Desktop when booting into snapshot or BTRFS warning/error message appears from dmesg log"
arch=('any')
url="https://gitlab.com/Zesko/btrfs-desktop-notification.git"
license=('GPL3')
depends=('libnotify' 'dunst' 'systemd')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "snapper-snapshot-notification-git")
backup=("etc/${pkgname}.conf")
source=('git+https://gitlab.com/Zesko/btrfs-desktop-notification.git')
sha256sums=('SKIP')


package() {
  cd "$srcdir/${pkgname}"
  cp -vr usr etc "$pkgdir"
}
