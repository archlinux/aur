pkgname=nxengine-evo-bin
pkgver=2.6.5
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_i386=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="Modern open source Engine to play CaveStory"
arch=('x86_64' 'i386' 'i686' 'aarch64')
url="https://github.com/diasurgical/-/raw/main/nxengine-evo-"
conflicts=("nxengine-evo" "nxengine-evo-git")
license=('GPL')
depends=('sdl2' 'sdl2_image' 'libpng' 'libjpeg')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_i386=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/cavestory-bin/nxengine-evo-bin/$pkgver-$pkgrel/-/raw/main/nxengine-evo-linux-x64.tar.xz")
source_i386=("https://gitlab.com/cavestory-bin/nxengine-evo-bin/$pkgver-$pkgrel/-/raw/main/nxengine-evo-linux-i386.tar.xz")
source_i686=("https://gitlab.com/cavestory-bin/nxengine-evo-bin/$pkgver-$pkgrel/-/raw/main/nxengine-evo-linux-i386.tar.xz")
source_aarch64=("https://gitlab.com/cavestory-bin/nxengine-evo-bin/$pkgver-$pkgrel/-/raw/main/nxengine-evo-linux-aarch64.tar.xz")


package() {
	install -dm755 "$pkgdir/usr/local/share/games/nxengine-evo"
   install -dm755 "$pkgdir/usr/bin"
   cp -r $srcdir/nxengine-evo $pkgdir/usr/local/share/games/nxengine-evo
   ln -sf $pkgdir/usr/local/share/games/nxengine-evo/nxengine-evo $pkgdir/usr/bin/nxengine-evo
}