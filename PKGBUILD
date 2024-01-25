pkgname=sm64ex-bin
_pkgname=Sm64ex-bin
pkgver=951389c
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
pkgdesc="A reverse engineered implementation engine for Super Mario 64."
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/supermario64pkg"
license=('GPL')
depends=('sdl2')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_i386=('SKIP')
sha256sums_i686=('SKIP')
source_x86_64=("https://gitlab.com/supermario64pkg/binaries/$pkgver/-/raw/main/sm64ex-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/supermario64pkg/binaries/$pkgver/-/raw/main/sm64ex-linux-arm64.tar.xz")
source_i386=("https://gitlab.com/supermario64pkg/binaries/$pkgver/-/raw/main/sm64ex-linux-i686.tar.xz")
source_i686=("https://gitlab.com/supermario64pkg/binaries/$pkgver/-/raw/main/sm64ex-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    mv "$srcdir/sm64ex" "$pkgdir/usr/bin"
}
