# Maintainer: Marvin1099
pkgname=user-updater
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple bash tool for automatic system updates using topgrade, featuring a background systemd service and a lightweight GUI to notify users of ongoing updates"
arch=('any')
url="https://codeberg.org/marvin1099/user_updater"
license=('AGPLv3')
depends=('bash' 'grep' 'coreutils' 'gawk' 'git' 'procps-ng' 'sed' 'shadow' 'sudo' 'systemd' 'topgrade' 'util-linux' 'yad')
optdepends=('docker' 'flatpak' 'python' 'python-pip' 'rust' 'xorg-xrandr')
source=("git+$url.git")
md5sums=('SKIP')
install=user_updater.install

package() {
  install -dm755 "$pkgdir/var/lib/user_updater"
  cp -a "$srcdir/user_updater/." "$pkgdir/var/lib/user_updater/"
}
