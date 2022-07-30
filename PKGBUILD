# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="Elegant music app to play & manage music library. Lyrics & playlists. YouTube Music support."
arch=("x86_64")
url="https://github.com/harmonoid/harmonoid"
license=("custom")
depends=("mpv")
makedepends=()
optdepends=()
source=("harmonoid-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/alexmercerind2/harmonoid-releases/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums=('1ee11a4694f248faa68b4d71daf07c3842c92793db1eb56982bf1c1ace5a4385')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
