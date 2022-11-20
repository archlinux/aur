# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Plays & manages your music library. Looks beautiful & juicy. Playlists, visuals, synced lyrics, pitch shift, volume boost & more."
arch=("x86_64")
url="https://github.com/harmonoid/harmonoid"
license=("custom")
depends=("mpv" "xdg-user-dirs")
makedepends=()
optdepends=()
options=(!strip)
source=("harmonoid-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/alexmercerind2/harmonoid-releases/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums=('324ae400a8a190532e5070b6777746a2a1bf8a0aabc5c863a55c3232c916166d')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
