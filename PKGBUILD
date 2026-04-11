pkgname=rsdkv4-bin
_pkgname=RSDKv4-bin
pkgver=1.3.3
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="RSDKv4 engine for Sonic 1 and Sonic 2."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/RSDKv4"
license=('GPL')
depends=('wget' 'sdl2' 'sdl2_ttf' 'sdl2_mixer' 'glew')
makedepends=('unzip')
source=('rsdkv4')
source_x86_64=("$url/binaries/$pkgver/-/raw/main/RSDKv4-linux-x64.tar.xz")
source_aarch64=("$url/binaries/$pkgver/-/raw/main/RSDKv4-linux-arm64.tar.xz")
sha256sums=('15dc08def231b5bce3d7902677dab0aeafb9536484645ebd6c7c8c269c3d2d28')
sha256sums_x86_64=('7909e429d00218eade72740e80c75ee264516e381027befdc694e349769d1804')
sha256sums_aarch64=('7ca0617d016b3b2157332130a4198d2b0394cd986bbe925f71a03279183d160a')

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/RSDKv4"
    chmod +x "$srcdir/rsdkv4"
    cp -r "$srcdir/rsdkv4" "$pkgdir/usr/bin/RSDKv4"
    cp -r "$srcdir/usr/lib" "$pkgdir/usr/lib/RSDKv4"
    cp -r "$srcdir/RSDKv4" "$pkgdir/usr/lib/RSDKv4/RSDKv4"


}
