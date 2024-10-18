pkgname=gzdoom-bin
pkgver=4.13.0
pkgrel=1
pkgdesc='Feature centric port for all Doom engine games'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/gzdoom"
license=('BSD' 'GPL3' 'LGPL3')
depends=('gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'zmusic')
conflicts=("gzdoom" "gzdoom-git" "zmusic-bin")
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('3bfe92c2791e27b44c82f79109c102f271e4ebe9bc13e2c32b91f9a6efe1ced4')
sha256sums_aarch64=('73f2887d1a363de3fd494d28a51eab91b9816830e8086b20ab3446cb124ac75b')
source_x86_64=("https://gitlab.com/linuxbombay/gzdoom/binaries/$pkgver/-/raw/main/gzdoom-$pkgver-x64.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/gzdoom/binaries/$pkgver/-/raw/main/gzdoom-$pkgver-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/gzdoom"
    install -dm755 "$pkgdir/usr/share/icons"    
    install -dm755 "$pkgdir/usr/share/licenses" 
    install -dm755 "$pkgdir/usr/share/doc"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cp -r "$srcdir/usr" "$pkgdir"
}
