# Maintainer: Manoel Vilela <manoel_vilela@engineer.com>

pkgname="emacs-openrc"
pkgver="1.0"
pkgrel=1
pkgdesc="Init script for emacs daemon for openrc"
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
source=()
noextract=("emacs-daemon.rc")

package() {
  # Creating need directories
  install -dm755 "$pkgdir/etc/init.d"
  install -Dm755 "emacs-daemon.rc" $pkgdir/etc/init.d/emacs
}
