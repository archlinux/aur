pkgname=uzdoom-bin
pkgver=4.15pre
pkgrel=1
pkgdesc='A fork of GZDoom, a feature-centric fork of ZDoom'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/gzdoom"
license=('BSD' 'GPL3' 'LGPL3')
depends=('bzip2' 'gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'zmusic-bin' 'libvpx')
conflicts=("uzdoom-git")
makedepends=('unzip')
sha256sums_x86_64=('9a5896392a4334387e5a07905e496cce80dd5cc008067e4b1873d5db0bee0b4c')
sha256sums_aarch64=('a243e8be9eee8c17433f484e2d0fcb2425f85a4291ee1a1b9d9d091b7794b664')
source_x86_64=("uzdoom-$pkgver-x64.tar.xz::https://gitlab.com/linuxbombay/uzdoom/binaries/$pkgver/-/raw/main/uzdoom-x64.tar.xz")
source_aarch64=("uzdoom-$pkgver-arm64.tar.xz::https://gitlab.com/linuxbombay/uzdoom/binaries/$pkgver/-/raw/main/uzdoom-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib"
    install -dm755 "$pkgdir/usr/share/uzdoom"
    install -dm755 "$pkgdir/usr/share/icons"    
    install -dm755 "$pkgdir/usr/share/licenses" 
    install -dm755 "$pkgdir/usr/share/doc"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cp -r "$srcdir/usr" "$pkgdir"
}
