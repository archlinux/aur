pkgname=thextech-bin
_pkgname=TheXtech-bin
pkgver=1.3.6.4
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
pkgdesc="SMBX engine."
arch=('i386' 'i686' 'pentium4' 'x86_64' 'aarch64')
url="https://gitlab.com/wolfenstein3d"
license=('GPL')
depends=('sdl2')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_i386=('SKIP')
sha256sums_i686=('SKIP')
source_x86_64=("https://github.com/Wohlstand/TheXTech/releases/download/v$pkgver/thextech-plain-runtime-v$pkgver-linux-generic-u20.04-amd64.tar.gz")
source_aarch64=("https://gitlab.com/thextech-archive/binaries/$pkgver/-/raw/main/thextech-linux-arm64.tar.xz")
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
