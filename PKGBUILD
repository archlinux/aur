# Maintainer: Rishab Ramanathan <rrishab2001 at gmail dot tld>
pkgname=pong-ramanathan-git
pkgver=0.1
pkgrel=1
pkgdesc="Basic pong game made with SDL in c++"
arch=(x86_64)
url="https://github.com/wonder-coconut/pong.git"
license=('GPL')
depends=(sdl2 sdl2_ttf sdl2_mixer)
makedepends=(git make)
optdepends=()
provides=(pong-ramanathan)
source=("git+$url")
md5sums=(SKIP)

package() {
	cd pong
	make DESTDIR="$pkgdir/" install
}
