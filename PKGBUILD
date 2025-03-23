pkgname=relive-bin
pkgver=1.0.9
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
pkgdesc="An Open-Source Engine Replacement for Oddworld: Abe's Oddysee and Oddworld: Abe's Exoddus."
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/relive"
license=('GPL')
depends=('sdl2')
makedepends=('unzip')
sha256sums_i686=('1b4e1a2a3b5bdda223a155b6e29937249f3501970501f678afa260565e9dd357')
sha256sums_x86_64=('72a3ef370bc01852846f3c98cfc37f463e2d2097c0e7ec7c958618d4fcd9bdf6')
sha256sums_aarch64=('1b4e1a2a3b5bdda223a155b6e29937249f3501970501f678afa260565e9dd357')
source_x86_64=("relive-$pkgver-linux-x64.tar.xz::https://gitlab.com/linuxbombay/relive/binaries/$pkgver/-/raw/main/relive-linux-x64.tar.xz")
source_aarch64=("relive-$pkgver-linux-arm64.tar.xz::https://gitlab.com/linuxbombay/relive/binaries/$pkgver/-/raw/main/relive-linux-arm64.tar.xz")
source_i686=("relive-$pkgver-linux-i686.tar.xz::https://gitlab.com/linuxbombay/relive/binaries/$pkgver/-/raw/main/relive-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/relive" "$pkgdir/usr/bin"
}
