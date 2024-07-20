pkgname=fheroes2-bin
_pkgname=FHeroes2-bin
pkgver=1.1.1
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
sha256sums_x86_64=('86b6532dd1bd2b9396faa86a2e31e8d09dc73ec0e7a3990a30f1cb6bbf17b6a0')
sha256sums_aarch64=('f689c8a6f00406d231459c2e4b0e3dd2d965f75dfff4f83067d9e7b8d89b8d93')
source_x86_64=("https://github.com/ihhub/fheroes2/releases/download/$pkgver/fheroes2_ubuntu_x86-64_SDL2.zip")
source_aarch64=("https://github.com/ihhub/fheroes2/releases/download/$pkgver/fheroes2_ubuntu_arm64_SDL2.zip")


package() {
   install -dm755 "$pkgdir/usr/bin"
   
   install -Dm755 "$srcdir/fheroes2" "$pkgdir/usr/bin"
}
