pkgname=jellyfin-dinit
pkgver=12.2
pkgrel=1
pkgdesc='dinit service script for Jellyfin'
arch=(any)
url='https://jellyfin.org'
license=(GPL-2.0-or-later)
depends=(
  dinit
  jellyfin-server
)
optdepends=(
  'jellyfin-web: web UI served by the server'
)
backup=(etc/dinit.d/jellyfin)
source=(jellyfin)
sha256sums=('e904df6f28d6a0d3e8db4ee0855528faa5ab5c1b6aa207af8d99b0254a912c6c')

package() {
  install -Dm644 jellyfin "$pkgdir/etc/dinit.d/jellyfin"
}
