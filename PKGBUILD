# $Id$
# Maintainer: Cédric Bellegarde <cedric.bellegarde@adishatz.org>

pkgname=shared-mime-info-gnome
pkgver=1.0
pkgrel=2
pkgdesc="GNOME Shared MIME Info"
arch=('x86_64')
license=('GPL2')
depends=('shared-mime-info')
source=(mimeapps.list)
sha256sums=('a8a9a422ccde9d608912a8435db7870c7ad5c78086922e3f889a90d1694a8eaf')
options=(!makeflags)

package() {
  install -Dm644 "$srcdir"/mimeapps.list "$pkgdir"/usr/share/applications/gnome-mimeapps.list
}
