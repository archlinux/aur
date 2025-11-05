pkgname=thextech-bin
_pkgname=TheXtech-bin
pkgver=1.3.7.1
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
sha256sums_i386=('3b5dfc869b60d7fde25a325a65fa49037163052438a80dad9337baca7f848dae')
sha256sums_i686=('3b5dfc869b60d7fde25a325a65fa49037163052438a80dad9337baca7f848dae')
sha256sums_x86_64=('ea06e0a6b08a1f01bdb4abd6d8eedfcb8b6cc7ccf695b15a064d224389c45540')
sha256sums_aarch64=('da966a7f4fe9e6307c79c761ac83f447e7b7094bdc9f833826108c372e247d43')
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
