# Maintainer Crewmate <sus@morshu.xyz>
pkgname=gnome-shell-extension-fullscreen-notifications-git
_pkgname=gnome-shell-extension-fullscreen-notifications
pkgver=4
pkgrel=1
pkgdesc="Extension that enables all notifications in fullscreen mode"
arch=('any')
url="https://github.com/soal/gnome-shell-extension-fullscreen-notifications"
license=(GPL2)
depends=('gnome-shell')
makedepends=('git')
source=("git+https://github.com/soal/gnome-shell-extension-fullscreen-notifications")
md5sums=('SKIP')

build() {
  return 0
}

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r $srcdir/$_pkgname/fullscreen-notifications@sorrow.about.alice.pm.me $pkgdir/usr/share/gnome-shell/extensions/
  install -Dm644 $srcdir/$_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
