pkgname=hexshell-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Cyberpunk sci-fi terminal for Linux"
arch=('x86_64')
url="https://github.com/TSMaitryDotDev/hexshell"
license=('MIT')

depends=(
  'gtk3'
  'nss'
)

source=(
  "HexShell-${pkgver}.AppImage::https://github.com/TSMaitryDotDev/hexshell/releases/download/v${pkgver}/HexShell-${pkgver}.AppImage"
)

sha256sums=('SKIP')

package() {
  install -Dm755 \
    "${srcdir}/HexShell-${pkgver}.AppImage" \
    "${pkgdir}/usr/bin/hexshell"
}
