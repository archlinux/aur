# $Id$
# Maintainer: Cédric Bellegarde <cedric.bellegarde@adishatz.org>

pkgname=shared-mime-info-gnome
pkgver=40.5
pkgrel=1
pkgdesc="GNOME Shared MIME Info. Default GNOME file associations"
arch=('x86_64')
license=('GPL2')
depends=('shared-mime-info')
source=(mimeapps.list)
sha256sums=('60b95e7597099e53e4bbf8a2e354824549c89bfe6586ca920af945b9023b3922')
options=(!makeflags)

package() {
  install -Dm644 "$srcdir"/mimeapps.list "$pkgdir"/usr/share/applications/gnome-mimeapps.list
}
