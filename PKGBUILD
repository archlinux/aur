# Maintainer: kamisaki
# Description: Terminal üzerinden Türkçe anime izleme aracı

pkgname=anitr-cli
pkgver=3.4.0
pkgrel=1
pkgdesc="Terminal üzerinden Türkçe anime izleme aracı"
arch=('x86_64')
url="https://github.com/xeyossr/anitr-cli"
license=('GPL3')
depends=('mpv')
optdepends=('rofi: for --rofi mode')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}::https://github.com/xeyossr/anitr-cli/releases/download/v${pkgver}/anitr-cli")
noextract=("${pkgname}-${pkgver}")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
