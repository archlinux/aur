pkgname=jazz2-native-bin
pkgver=2.6.0
pkgrel=2
pkgdesc="Jazz jackrabbit 2 Reimplimentation engine."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/jazz2-native"
license=('GPL')
depends=('sdl2' 'openal' 'glew' 'glfw' 'libopenmpt')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('0e55d87f0356e99083e400a66c14f48dadae738ced3f7766a6dd5f7b2cd97133')
sha256sums_aarch64=('edc329adaec9beadb139b9f3f7a0ec56d2678fcb437244a298ac16be5e06f565')
source_x86_64=("https://gitlab.com/linuxbombay/jazz2-native/binaries/$pkgver/-/raw/main/jazz2-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/jazz2-native/binaries/$pkgver/-/raw/main/jazz2-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/share/games/Jazz2"
    
    cp -rf "$srcdir/Content" "$pkgdir/usr/share/games/Jazz2"
    cp -rf "$srcdir/jazz2" "$pkgdir/usr/share/games/Jazz2"
}
