pkgname=thextech-bin
_pkgname=TheXtech-bin
pkgver=1.3.6.4
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
pkgdesc="SMBX engine."
arch=('i386' 'i686' 'pentium4' 'x86_64' 'aarch64')
url="https://github.com/Wohlstand/TheXTech"
provides=("thextech=${pkgver}");
license=('GPL')
depends=('sdl2')
makedepends=('unzip')
sha256sums_i386=('85ae9c765e34b7c66f22f80b759f7e14854249d3cc01a13e1d73dd8f7ddee90e')
sha256sums_i686=('85ae9c765e34b7c66f22f80b759f7e14854249d3cc01a13e1d73dd8f7ddee90e')
sha256sums_x86_64=('22229cde2bec64491e16762ee7792f3ffc329ac3ba1108f810f0dc9ad47bc0bb')
sha256sums_aarch64=('a3a05cec0ad13325b761c8518e023f9a6330434244218168fd35dd6343efba8f')
source_x86_64=("https://github.com/Wohlstand/TheXTech/releases/download/v$pkgver/thextech-plain-runtime-v$pkgver-linux-generic-u20.04-amd64.tar.gz")
source_aarch64=("https://gitlab.com/linuxbombay/thextech/$pkgver/-/raw/main/thextech-linux-arm64.tar.xz")
source_i386=("https://github.com/Wohlstand/TheXTech/releases/download/v$pkgver/thextech-plain-runtime-v$pkgver-linux-generic-u16.04-i386.tar.gz")
source_i686=("https://github.com/Wohlstand/TheXTech/releases/download/v$pkgver/thextech-plain-runtime-v$pkgver-linux-generic-u16.04-i386.tar.gz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    DIR="$srcdir/thextech-bin"
     if test -d "$DIR"
    then
     mv "$srcdir/thextech-bin/thextech" "$pkgdir/usr/bin"    
    else
     mv "$srcdir/thextech" "$pkgdir/usr/bin"
fi
}
