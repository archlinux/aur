# Maintainer: Sauyon Lee <sauyonl@sauyon.com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Marc Coiffier <marc.coiffier@gmail.com>

pkgname=systemd-emacs-daemon
pkgver=1
pkgrel=6
pkgdesc="A per-user emacs daemon service for systemd"
url='http://www.emacswiki.org/emacs/EmacsAsDaemon#toc8'
license=('GPL')

install=install
arch=('any')
source=('emacs.service')
sha256sums=('e1a159c131c69295dbeb2cdd0a3d66e3dd94d4a18329da839fdd14023d8bec61')

package() {
  install -Dm644 "$srcdir"/emacs.service "$pkgdir"/usr/lib/systemd/user/emacs.service
}
