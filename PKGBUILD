pkgname=fheroes2-bin
_pkgname=FHeroes2-bin
pkgver=1.1.0
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Modern open source Engine to play Heroes of Might and Magic 2, you will need to provide your own game files to play Heroes of Might and Magic 2."
arch=('x86_64' 'aarch64')
url="https://github.com/ihhub/fheroes2"
conflicts=("fheroes2" "fheroes2-git")
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
makedepends=('unzip')
sha256sums_x86_64=('ddf2ac07b7b942d61becc758c1e5e6e5f3bb066eb107ef07543da22e17038d4a')
sha256sums_aarch64=('779a3f2f0f35f905a5aa42b7170b16aed4174623fce5bca66120727f6ae55bee')
source_x86_64=("https://github.com/ihhub/fheroes2/releases/download/$pkgver/fheroes2_ubuntu_x86-64_SDL2.zip")
source_aarch64=("https://github.com/ihhub/fheroes2/releases/download/$pkgver/fheroes2_ubuntu_arm64_SDL2.zip")


package() {
   install -dm755 "$pkgdir/usr/bin"
   
   install -Dm755 "$srcdir/fheroes2" "$pkgdir/usr/bin"
}
