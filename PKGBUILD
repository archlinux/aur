_pkgname=journalctl-desktop-notification
pkgname="${_pkgname}-git"
pkgver=1.0.0
pkgrel=1
pkgdesc="The notification notifies on the desktop when any error message appeared in Journalctl log."
arch=("any")
url="https://gitlab.com/Zesko/${_pkgname}.git"
license=("GPL3")
makedepends=('git' 'dunst' 'systemd')
source=(git+${url})
sha256sums=("SKIP")


package() {
  cd "$srcdir/$_pkgname"
  cp -vr usr "$pkgdir"
  cp -vr etc "$pkgdir"
}
