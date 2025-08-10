# Maintainer: Dainis Koknese <gatesby@protonmail.com>

pkgname=harmonoid-bin
pkgver=0.3.10
pkgrel=2
pkgdesc="Plays & manages your music library. Looks beautiful & juicy. Playlists, visuals, synced lyrics, pitch shift, volume boost & more."
arch=("x86_64")
url="https://github.com/harmonoid/harmonoid"
license=("custom")
depends=("mpv" "xdg-user-dirs" "xdg-utils")
makedepends=()
optdepends=()
options=(!strip)
source=("harmonoid-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/alexmercerind2/harmonoid-releases/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums=('19317d2ab713a2509cd70fd64f47e5c25042062b6c9053da26e354771096f60b')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
