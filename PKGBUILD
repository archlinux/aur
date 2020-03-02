# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

pkgname=webcam-access-monitor
pkgver=0.2.4
pkgrel=3
pkgdesc="D-Bus service and Gnome Shell extension to monitor webcam access."
arch=('any')
url="https://github.com/phw/webcam-access-monitor"
license=('GPL3')
depends=('python' 'python-pyinotify' 'python-gobject' 'python-dbus' 'psmisc')
optdepends=('gnome-shell')
makedepends=(git)
source=("git://github.com/phw/webcam-access-monitor.git#tag=${pkgver}")
md5sums=('SKIP')

package() {
  cd "$pkgname"
  ./install.sh "${pkgdir}"
}
