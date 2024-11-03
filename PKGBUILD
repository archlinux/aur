pkgname=thextech-bin
_pkgname=TheXtech-bin
pkgver=1.3.6.6
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
sha256sums_i386=('24afbb17285139bc2f9db4466323fbb017f95c0c9c04bd81ac4cf5c9af4ac0fc')
sha256sums_i686=('24afbb17285139bc2f9db4466323fbb017f95c0c9c04bd81ac4cf5c9af4ac0fc')
sha256sums_x86_64=('a24bca30d5b53cdac7b53a4d78365c19467b986ddac9238d7374d7bf3ad79b57')
sha256sums_aarch64=('d00ab92a8781dd0b2086b1d2d451287ea0fffa20d25f572b6b0c724947ac57e0')
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
