pkgname=oneweb-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="OneWeb – lekka przeglądarka internetowa (AppImage)"
arch=("x86_64")
url="https://github.com/OneDevelopmentPL/oneweb"
license=("MIT")
depends=("fuse2" "glibc")
options=(!strip)

source=("OneWeb_Browser-x86_64.AppImage::https://github.com/OneDevelopmentPL/oneweb/releases/download/v${pkgver}/OneWeb_Browser-x86_64.AppImage"
        "oneweb.desktop")
source=("OneWeb_Browser-x86_64.AppImage::https://github.com/OneDevelopmentPL/oneweb/releases/download/v2/OneWeb-${pkgver}.AppImage")
sha256sums=("85c3fcfc2870ce6f37e633aa61ef28b39714e90a259b5acf289ea0c764c23e1a")

package() {
    install -Dm755 "$srcdir/OneWeb_Browser-x86_64.AppImage" "$pkgdir/usr/bin/oneweb"
    install -Dm644 "$srcdir/oneweb.desktop" "$pkgdir/usr/share/applications/oneweb.desktop"
}

