pkgname=thextech-bin
_pkgname=TheXtech-bin
pkgver=1.3.7.3
pkgrel=1
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
sha256sums_i386=('19d015ee0dd4ea64849209b2c3b3fd75a263c59777ac057ea7478f2a7178653b')
sha256sums_i686=('19d015ee0dd4ea64849209b2c3b3fd75a263c59777ac057ea7478f2a7178653b')
sha256sums_x86_64=('cf527acd4e900a8f239591916e3969586993bca5ff82615e5e36aab9f61c6462')
sha256sums_aarch64=('bd22b0131540b57d3e4f1da42cfffbf19133ceb870df24b772467a10a6a711f4')
source_x86_64=("https://github.com/Wohlstand/TheXTech/releases/download/v$pkgver/thextech-plain-runtime-v$pkgver-linux-generic-u20.04-amd64.tar.gz")
source_aarch64=("https://github.com/TheXTech/TheXTech/releases/download/v$pkgver/thextech-plain-runtime-v$pkgver-linux-generic-u20.04-aarch64.tar.gz")
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
