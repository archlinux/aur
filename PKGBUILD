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
url="https://gitlab.com/eduke32-linux"
conflicts=("eduke32" "eduke32-git")
license=('GPL')
depends=('libvpx' 'sdl2' 'flac' 'libvorbis' 'alsa-lib' 'libvpx')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_pentium4=('SKIP')
sha256sums_i386=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/eduke32-linux/binaries/duke32-$pkgver/-/raw/main/eduke32-linux-x64.tar.xz")
source_i386=("https://gitlab.com/eduke32-linux/binaries/duke32-$pkgver/-/raw/main/eduke32-linux-i386.tar.xz")
source_pentium4=("https://gitlab.com/eduke32-linux/binaries/duke32-$pkgver/-/raw/main/eduke32-linux-i386.tar.xz")
source_i686=("https://gitlab.com/eduke32-linux/binaries/duke32-$pkgver/-/raw/main/eduke32-linux-i386.tar.xz")
source_aarch64=("https://gitlab.com/eduke32-linux/binaries/duke32-$pkgver/-/raw/main/eduke32-linux-aarch64.tar.xz")


package() {
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/lib"

   # Link to binary
   ln -sf "$srcdir/eduke32" "$pkgdir/usr/bin"
   ln -sf "$srcdir/mapster32" "$pkgdir/usr/bin"   
}
