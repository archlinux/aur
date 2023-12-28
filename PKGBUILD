pkgname=smw-bin
_pkgname=SMW-bin
pkgver=0.1
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
#_pkgrel_i386=1
#_pkgrel_i686=1
pkgdesc="A reverse engineered implementation engine for Super Mario World."
arch=('x86_64' 'aarch64')
url=""
license=('GPL')
depends=('sdl2')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
#sha256sums_i386=('SKIP')
#sha256sums_i686=('SKIP')
source_x86_64=("https://gitlab.com/smw4/binaries/$pkgver/-/raw/main/smw-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/smw4/binaries/$pkgver/-/raw/main/smw-linux-arm64.tar.xz")
#source_i386=("")
#source_i686=("")

package() {
    install -dm755 "$pkgdir/usr/bin"
    mv "$srcdir/smw" "$pkgdir/usr/bin"
}