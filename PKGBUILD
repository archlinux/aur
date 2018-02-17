# Maintainer: Manoel Vilela <manoel_vilela@engineer.com>

pkgname="emacs-openrc"
pkgver="1.1"
pkgrel=5
pkgdesc="OpenRC emacs-daemon init script"
arch=('i686' 'x86_64')
license=('GPL3')
groups=()
depends=("emacs" "openrc")
makedepends=()
optdepends=()
provides=('openrc-emacs')
conflicts=('openrc-emacs')
replaces=('openrc-emacs')
backup=()
options=()
install="$pkgname.install"
changelog="CHANGELOG"
source=("emacs-daemon.rc")
md5sums=('3c64ace1a95c705725d78498847f6d8e')

package() {
  # Creating need directories
  install -dm755 "$pkgdir/etc/init.d"
  install -Dm755 "$srcdir/emacs-daemon.rc" $pkgdir/etc/init.d/emacs
}
