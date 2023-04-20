# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.3.8
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
sha256sums=('9cb0a34cb1c3e2067a964613f0b75c8004690b17685e0defc43b23fc46e7164e')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
