# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Elegant music app to play & manage music library. Lyrics & playlists. YouTube Music support."
arch=("x86_64")
url="https://github.com/harmonoid/harmonoid"
license=("custom")
depends=("mpv")
makedepends=()
optdepends=()
source=("harmonoid-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/alexmercerind2/harmonoid-releases/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums=('276eebb8a50195def15503bc3c60368a225b428835382bff3e6f7d6133b705b5')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
