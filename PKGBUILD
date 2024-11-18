pkgname=fheroes2-bin
_pkgname=FHeroes2-bin
pkgver=1.1.3
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
sha256sums_x86_64=('7f039ea44e034cd9a0ac3943a248e1182bf21437e9124bfc7a48d0083f158ff8')
sha256sums_aarch64=('644203b5b96dd61b354c1e9c8e27ae4b6b56652cda9b32068dbc4116487c493f')
source_x86_64=("https://github.com/ihhub/fheroes2/releases/download/$pkgver/fheroes2_ubuntu_x86-64_SDL2.zip")
source_aarch64=("https://github.com/ihhub/fheroes2/releases/download/$pkgver/fheroes2_ubuntu_arm64_SDL2.zip")


package() {
   install -dm755 "$pkgdir/usr/bin"
   
   install -Dm755 "$srcdir/fheroes2" "$pkgdir/usr/bin"
}
