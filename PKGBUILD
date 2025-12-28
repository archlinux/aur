pkgname=thextech-bin
_pkgname=TheXtech-bin
pkgver=1.3.7.2
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
sha256sums_i386=('c40f5c7e94b4e8f6d408d7c755408b2a794e74b33a3feb3bf93d6f4406242be8')
sha256sums_i686=('c40f5c7e94b4e8f6d408d7c755408b2a794e74b33a3feb3bf93d6f4406242be8')
sha256sums_x86_64=('e7f5fd8490a0ed90bb2862bb736539ba76ca492483b68e0545cb306ce327b54f')
sha256sums_aarch64=('bb28c8e36c1b1e99aeddf1d8a403431405b300b2f1f3a916122f9d573302282d')
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
