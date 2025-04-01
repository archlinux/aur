# Maintainer Matthew Anderson <mpa.business@pm.me>
pkgname=plex-media-server-dinit
pkgver=1
pkgrel=1
pkgdesc="Dinit service scripts for Plex Media Server"
arch=('any')
license=('Unlicense')
depends=('plex-media-server' 'dinit')
source=("plexmediaserver")
sha256sums=('d47b5f7d6764f31d394679e6b3191cb2feb4666ebd998dc10aae8bb2a374c38c')
package() {
  install -D -m 644 "${srcdir}/plexmediaserver" "${pkgdir}/usr/lib/dinit.d/plexmediaserver"
}
