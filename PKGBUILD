# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Elegant music app to play & manage music library. Lyrics & playlists. YouTube Music support."
arch=("x86_64")
url="https://github.com/harmonoid/harmonoid"
license=("custom")
depends=("mpv")
makedepends=()
optdepends=()
source=("harmonoid-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/harmonoid/harmonoid/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums=('7e5240e9223daeac70002ea1b2ef5165ed1a04efe5a6c7e532a0d5940c7ee234')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
