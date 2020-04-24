# Maintainer: Julius Dehner <julius.dehner@protonmail.com>

pkgname=plexamp-appimg
pkgver=3.0.1
pkgrel=0
pkgdesc="Music focused client for Plex"
provides=('plexamp')
conflicts=('plexamp')
arch=('x86_64')
url="https://plexamp.plex.tv"
options=(!strip)
source=(
  ${url}/plexamp.plex.tv/desktop/Plexamp-${pkgver}.AppImage
  plexamp.desktop
  plexamp.svg::https://plexamp.com/img/plexamp_transparent.svg
)
sha512sums=(
  SKIP
  SKIP
  SKIP
)

package() {
  echo "Starting install"
  install -Dm755 Plexamp-${pkgver}.AppImage "$pkgdir"/usr/bin/Plexamp.AppImage
  echo '"$pkgdir"/usr/bin/Plexamp.AppImage'
  install -Dm755 plexamp.desktop "$pkgdir"/usr/share/applications/plexamp.desktop
  install -Dm644 plexamp.svg "$pkgdir"/usr/share/icons/plexamp.svg
}
