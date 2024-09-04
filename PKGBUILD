pkgname=sm64ex-bin
_pkgname=Sm64ex-bin
pkgver=951389c
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
pkgdesc="A reverse engineered implementation engine for Super Mario 64."
arch=('pentium4' 'i386' 'i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/sm64ex"
license=('GPL')
depends=('sdl2' 'glew')
makedepends=('unzip')
sha256sums_i386=('7a4eba2028a7f6f6e7efe706bc2519b47e3761c38b12c0f21180f5a074292ae3')
sha256sums_i686=('7a4eba2028a7f6f6e7efe706bc2519b47e3761c38b12c0f21180f5a074292ae3')
sha256sums_x86_64=('c2e45291b58c7ffc35a7501d501e6c935c7b366baba63a42ecd87d52a773e80f')
sha256sums_aarch64=('7728a6b1a08f8d79c727315a63e9ba266ad614418f6609f18c3ff653ce5e8b97')
source_x86_64=("$url/$pkgver/-/raw/main/sm64ex-linux-x64.tar.xz")
source_aarch64=("$url/$pkgver/-/raw/main/sm64ex-linux-arm64.tar.xz")
source_i386=("$url/$pkgver/-/raw/main/sm64ex-linux-i686.tar.xz")
source_i686=("$url/$pkgver/-/raw/main/sm64ex-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    mv "$srcdir/sm64ex" "$pkgdir/usr/bin"
}
