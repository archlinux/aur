pkgname=jazz2-native-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="Jazz jackrabbit 2 Reimplimentation engine."
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('sdl2' 'openal' 'glew' 'glfw')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/jazzproject/jazzjackrabbit2/binaries/$pkgver/-/raw/main/jazz2-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/jazzproject/jazzjackrabbit2/binaries/$pkgver/-/raw/main/Jazz2-linux-arm64.tar.xz")
url="https://gitlab.com/jazzproject"

package() {
    install -dm755 "$pkgdir/usr/share/games/Jazz2"
    
    cp -rf "$srcdir/Content" "$pkgdir/usr/share/games/Jazz2"
    cp -rf "$srcdir/jazz2" "$pkgdir/usr/share/games/Jazz2"
}
