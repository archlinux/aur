# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Elegant music app to play & manage music library. Lyrics & playlists. YouTube Music support."
arch=("x86_64")
url="https://github.com/harmonoid/harmonoid"
license=("custom")
depends=("mpv")
makedepends=()
optdepends=()
source=("harmonoid-linux-${pkgver//_/-}-x86_64.tar.gz::https://github.com/alexmercerind2/harmonoid-releases/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums=('58204b1e2ec1ee6a5e291e4dd655b88714ad1518a70eb2b28b4969a5450af31f')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
