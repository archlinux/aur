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
url="https://gitlab.com/spacecadetpinball"
license=('GPL')
depends=('wget' 'sdl2' 'sdl2_mixer' 'timidity++')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_i386=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/spacecadetpinball/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-x64.tar.xz")
source_i386=("https://gitlab.com/spacecadetpinball/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-i686.tar.xz")
source_i686=("https://gitlab.com/spacecadetpinball/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-i686.tar.xz")
source_aarch64=("https://gitlab.com/spacecadetpinball/binaries/$pkgver/-/raw/main/SpaceCadetPinball-Linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    mv "$srcdir/SpaceCadetPinball" "$pkgdir/usr/bin"
}
