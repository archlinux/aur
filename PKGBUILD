pkgname=scp-bin
_pkgname=SCP-bin
pkgver=2.1.0
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_i386=1
_pkgrel_i686=1
_pkgrel_aarch64=1
pkgdesc="Space Cadet Pinball engine for Space Cadet Pinball and Full Tilt! Pinball."
arch=('x86_64' 'aarch64' 'i386' 'i686')
url="https://gitlab.com/linuxbombay/spacecadetpinball"
license=('GPL')
depends=('wget' 'sdl2' 'sdl2_mixer' 'timidity++')
makedepends=('unzip')
sha256sums_x86_64=('6ee764f7d51a7d7d32bdb8463feb78fd1447a821a46e2a6e70a2dec5e2d2d54f')
sha256sums_aarch64=('127ea73d8ac6651792ba6707efb65b2204e9f4b55fa59ca5f61ee80568cb071e')
sha256sums_i386=('c8942dc85637f4a1b3a5bda00be247dbcb6f7047487649f9f532079bf6e0952d')
sha256sums_i686=('c8942dc85637f4a1b3a5bda00be247dbcb6f7047487649f9f532079bf6e0952d')
source_x86_64=("$url/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-x64.tar.xz")
source_i386=("$url/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-i686.tar.xz")
source_i686=("$url/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-i686.tar.xz")
source_aarch64=("$url/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    mv "$srcdir/SpaceCadetPinball" "$pkgdir/usr/bin"
}
