# Maintainer: Manoel Vilela <manoel_vilela@engineer.com>

pkgname="emacs-openrc"
pkgver="1.2"
pkgrel=5
pkgdesc="OpenRC emacs-daemon init script"
arch=(any)
license=("GPL3")
groups=()
depends=("emacs" "openrc")
makedepends=()
optdepends=()
provides=("openrc-emacs")
conflicts=("openrc-emacs")
replaces=("openrc-emacs")
backup=()
options=()
install="$pkgname.install"
changelog="CHANGELOG"
source=("emacs-daemon.rc")
md5sums=("970591aef623dee2f89cbc581f4c3126")


package() {
  # Creating need directories
  install -dm755 "$pkgdir/etc/init.d"
  install -Dm755 "$srcdir/emacs-daemon.rc" $pkgdir/etc/init.d/emacs
}
