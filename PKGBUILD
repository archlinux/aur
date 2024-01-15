pkgname=wolf4sdl-bin
_pkgname=Wolf4SDL-bin
pkgver=1.0.0
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
_pkgrel_i386=1
_pkgrel_i686=1
pkgdesc="A reimplementation engine for the Wolfenstein3D game."
arch=('i386' 'i686' 'pentium4' 'x86_64' 'aarch64')
url="https://gitlab.com/wolfenstein3d"
license=('GPL')
depends=('sdl' 'sdl_mixer')
makedepends=('unzip')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_i386=('SKIP')
sha256sums_i686=('SKIP')
source_x86_64=("https://gitlab.com/wolfenstein3d/binaries/$pkgver-$pkgrel/-/raw/main/wolf4sdl-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/wolfenstein3d/binaries/$pkgver-$pkgrel/-/raw/main/wolf4sdl-linux-arm64.tar.xz")
source_i386=("https://gitlab.com/wolfenstein3d/binaries/$pkgver-$pkgrel/-/raw/main/wolf4sdl-linux-i686.tar.xz")
source_i686=("https://gitlab.com/wolfenstein3d/binaries/$pkgver-$pkgrel/-/raw/main/wolf4sdl-linux-i686.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    mv "$srcdir/wolf4sdl" "$pkgdir/usr/bin"
}
