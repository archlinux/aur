# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Elegant music app to play & manage music library. Lyrics & playlists. YouTube Music support."
arch=("x86_64")
url="https://github.com/harmonoid/harmonoid"
license=("custom")
depends=("mpv")
makedepends=()
optdepends=()
source=("https://github.com/harmonoid/harmonoid/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums=('1b72ebf1f27b361e1a11473a3c81840f733c24e57b446e4f58ab9bc366f876d4')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
