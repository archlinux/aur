# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.3.6
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
sha256sums=('8ae83bbf7573722233bc658e47cfcceb7c4bce87437108ed37ffa2989cf6c8f1')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
