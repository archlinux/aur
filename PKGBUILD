# Maintainer: kamisaki
# Description: Terminal üzerinden Türkçe anime izleme aracı

pkgname=anitr-cli
pkgver=3.6.0
pkgrel=2
pkgdesc="Terminal üzerinden Türkçe anime izleme aracı"
arch=('x86_64')
url="https://github.com/xeyossr/anitr-cli"
license=('GPL3')
depends=('mpv')

optdepends=(
    'rofi: for --rofi mode (recommended for X11 users)'
    'rofi-wayland: for --rofi mode (recommended for Wayland users)'
)

provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}-${pkgrel}::https://github.com/xeyossr/anitr-cli/releases/download/v${pkgver}-${pkgrel}/anitr-cli")
noextract=("${pkgname}-${pkgver}-${pkgrel}")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${pkgrel}" "${pkgdir}/usr/bin/${pkgname}"
}
