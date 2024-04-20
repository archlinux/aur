pkgname=eduke32-bin
pkgver=06.03.2024
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_i386=1
_pkgrel_pentium4=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="An advanced Duke Nukem 3D source port"
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64')
url="https://gitlab.com/linuxbombay/eduke32"
conflicts=("eduke32" "eduke32-git")
license=('GPL')
depends=('libvpx' 'sdl2' 'flac' 'libvorbis' 'alsa-lib' 'libvpx')
makedepends=('unzip')
sha256sums_x86_64=('086094a2865f79f43589995e2de338d314e26d15231a5d2dd5d7448d067b237f')
sha256sums_i386=('1eddb45952c178c344ab84354ae367cf1a61d5ebce0e7f91031c486bf8ffbdd4')
sha256sums_i686=('1eddb45952c178c344ab84354ae367cf1a61d5ebce0e7f91031c486bf8ffbdd4')
sha256sums_pentium4=('1eddb45952c178c344ab84354ae367cf1a61d5ebce0e7f91031c486bf8ffbdd4')
sha256sums_aarch64=('15b4e845bc37ee80e3bda3c5fe3c932285e66d47e22c525ad907d569a548a67b')
source_x86_64=("https://gitlab.com/linuxbombay/eduke32/binaries/duke32-$pkgver/-/raw/main/eduke32-linux-x64.tar.xz")
source_i386=("https://gitlab.com/linuxbombay/eduke32/binaries/duke32-$pkgver/-/raw/main/eduke32-linux-i686.tar.xz")
source_pentium4=("https://gitlab.com/linuxbombay/eduke32/binaries/duke32-$pkgver/-/raw/main/eduke32-linux-i686.tar.xz")
source_i686=("https://gitlab.com/linuxbombay/eduke32/binaries/duke32-$pkgver/-/raw/main/eduke32-linux-i686.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/eduke32/binaries/duke32-$pkgver/-/raw/main/eduke32-linux-arm64.tar.xz")


package() {
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/lib"

   # Link to binary
   cp -r "$srcdir/eduke32" "$pkgdir/usr/bin"
   cp -r "$srcdir/mapster32" "$pkgdir/usr/bin"   
}
