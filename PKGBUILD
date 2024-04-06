pkgname=openjazz-bin
pkgver=20231028
pkgrel=1
pkgdesc="Jazz jackrabbit 1 Reimplimentation engine."
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('sdl2' 'sdl2_net')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
source_x86_64=("https://gitlab.com/jazzproject/jazz-jackrabbit/binaries/$pkgver/-/raw/main/openjazz-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/jazzproject/jazz-jackrabbit/binaries/$pkgver/-/raw/main/openjazz-linux-arm64.tar.xz")
url="https://gitlab.com/jazzproject"

package() {
    install -dm755 "$pkgdir/usr/bin"
    cp -rf "$srcdir/openjazz" "$pkgdir/usr/bin"
}


