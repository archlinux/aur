pkgname=zelda3-bin
_pkgname=Zelda3-bin
pkgver=0.3
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
#_pkgrel_i386=1
#_pkgrel_i686=1
pkgdesc="A reverse engineered implementation engine for Legend Of Zelda: Link to the Past."
arch=('x86_64' 'aarch64')
url=""
license=('GPL')
depends=('sdl2')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
#sha256sums_i386=('SKIP')
#sha256sums_i686=('SKIP')
source_x86_64=("https://gitlab.com/zelda3pkg/binaries/$pkgver/-/raw/main/zelda3-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/zelda3pkg/binaries/$pkgver/-/raw/main/zelda3-linux-arm64.tar.xz")
#source_i386=("")
#source_i686=("")

package() {
    install -dm755 "$pkgdir/usr/bin"
    mv "$srcdir/zelda3" "$pkgdir/usr/bin"
}