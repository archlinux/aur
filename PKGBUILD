pkgname=thextech-bin
_pkgname=TheXtech-bin
pkgver=1.3.6.5
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
sha256sums_i386=('ce90eef926921fa0979b2f1d244122e560a5bb3990976747e9a90b148b29718c')
sha256sums_i686=('ce90eef926921fa0979b2f1d244122e560a5bb3990976747e9a90b148b29718c')
sha256sums_x86_64=('5e695e4c90c89a3be0fe5f36c4620173b2b5aad7e48f9b1a2658d7ddf551a502')
sha256sums_aarch64=('bb63fce74347b4cb7893b994308cf2a057d22726d1e2011868ca1a70721b98e7')
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
