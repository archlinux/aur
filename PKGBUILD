pkgname=nxengine-evo-bin
pkgver=2.6.5
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_i386=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="Modern open source Engine to play CaveStory"
arch=('x86_64' 'i386' 'i686' 'aarch64')
url="https://gitlab.com/linuxbombay/nxengine-evo"
conflicts=("nxengine-evo" "nxengine-evo-git")
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'libpng' 'libjpeg')
makedepends=('unzip')
sha256sums_x86_64=('c3f4b491093a68486d68a0434e66d1d83eb8e03694f29d3eb9472309dd48687e')
sha256sums_i386=('11276401db56438c0f68411f5cc9fc3f967af177e06bbd37d55a977b24ba2447')
sha256sums_i686=('11276401db56438c0f68411f5cc9fc3f967af177e06bbd37d55a977b24ba2447')
sha256sums_aarch64=('052f0f2d7f407f2f36876b5edee9aab8cb625a28e3b01b6448b126d354a19598')
source_x86_64=("$url/$pkgver-1/-/raw/main/nxengine-evo-linux-x64.tar.xz")
source_i386=("$url/$pkgver-1/-/raw/main/nxengine-evo-linux-i686.tar.xz")
source_i686=("$url/$pkgver-1/-/raw/main/nxengine-evo-linux-i686.tar.xz")
source_aarch64=("$url/$pkgver-1/-/raw/main/nxengine-evo-linux-arm64.tar.xz")


package() {
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/share/games/NXEngine-evo"
   
   cp -r $srcdir/. "$pkgdir/usr/share/games/NXEngine-evo"
  
  #Binary 
   ln -s /usr/share/games/NXEngine-evo/nxengine-evo "$pkgdir/usr/bin"
   ln -s /usr/share/games/NXEngine-evo/nxextract "$pkgdir/usr/bin"
}
