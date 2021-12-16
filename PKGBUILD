# Maintainer: Misha <mishakmak at gmail dot com>

pkgname=colab-chromium-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Desktop file for Google Colab as a Chromium WebApp"
arch=('any')
url="https://colab.research.google.com/"
license=('Unlicense')
depends=('chromium')
makedepends=('icoutils')
source=('GoogleColab.desktop' 'https://colab.research.google.com/img/favicon.ico')
sha256sums=('SKIP' '52232ddc81832d3edc91776ac1bc587fc40c91dc633e00b5f911466ad1c67f3a')

package() {
    cd "$srcdir"
    install -Dm644 "GoogleColab.desktop" "$pkgdir/usr/share/applications/GoogleColab.desktop"
    icotool -x favicon.ico
    install -Dm644 "favicon_1_128x128x32.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/googlecolab.png"
    install -Dm644 "favicon_2_32x32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/googlecolab.png"
    install -Dm644 "favicon_3_16x16x32.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/googlecolab.png"
}
