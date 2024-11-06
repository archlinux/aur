pkgname=gzdoom-bin
pkgver=4.13.2
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
sha256sums_x86_64=('bce798f548b5f2a4c8c50b69f7f9fe55912d0ec2acca8cf8a1affd25da7abfcc')
sha256sums_aarch64=('f79c8d6877b7ae2d0b9015f42975d78d27cdb9f3320941a8b3664652286390f9')
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
