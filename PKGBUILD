# Maintainer: Thomas Quillan <tjquillan@gmail.com>

pkgname=harmonoid-bin
pkgver=0.2.1_hotfix1
pkgrel=1
pkgdesc="Elegant music app to play & manage music library. Lyrics & playlists. YouTube Music support."
arch=("x86_64")
url="https://github.com/harmonoid/harmonoid"
license=("custom")
depends=()
makedepends=()
optdepends=()
source=("https://github.com/harmonoid/harmonoid/releases/download/v${pkgver//_/-}/harmonoid-linux-x86_64.tar.gz")
sha256sums=('e32680ab237d896598281662295ce6bbbca2a929ae5d384a25cd89e60b733ec1')

package() {
	cp -dr "$srcdir"/usr "$pkgdir"/usr
}
