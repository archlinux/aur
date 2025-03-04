pkgname=gzdoom-bin
pkgver=4.14.1
pkgrel=1
pkgdesc='Feature centric port for all Doom engine games'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/gzdoom"
license=('BSD' 'GPL3' 'LGPL3')
depends=('gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'zmusic>=1.1.8')
conflicts=("gzdoom" "gzdoom-git")
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('e8fe7b743cc52d13ac01455adf00ada32a0900b39e6f769fa9fd137579cf0d83')
sha256sums_aarch64=('6af3c2a2306d1db7ffe49e8253bc2af86be264632e6b86028aaa6edc53268f28')
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
