# Maintainer: Sauyon Lee <sauyonl@sauyon.com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Marc Coiffier <marc.coiffier@gmail.com>

pkgname=systemd-emacs-daemon
pkgver=2
pkgrel=1
pkgdesc="A per-user emacs daemon service for systemd"
url='http://www.emacswiki.org/emacs/EmacsAsDaemon#toc8'
license=('GPL')

install=install
arch=('any')
source=('emacs.service')
sha256sums=('c63dbb2165efe3a0ca43c8d7ad0f750876a619f53c0d766bf70b71c6ba18a415')

package() {
  install -Dm644 "$srcdir"/emacs.service "$pkgdir"/usr/lib/systemd/user/emacs.service
}
