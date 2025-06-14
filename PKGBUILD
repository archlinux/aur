# Maintainer: kamisaki
# Description: Terminal üzerinden Türkçe anime izleme aracı

pkgname=anitr-cli
pkgver=3.2.0
pkgrel=1
pkgdesc="Terminal üzerinden Türkçe anime izleme aracı"
arch=('x86_64')
url="https://github.com/xeyossr/anitr-cli"
license=('GPL-3')
depends=('mpv' 'rofi')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/xeyossr/anitr-cli/releases/latest/download/anitr-cli")
noextract=("anitr-cli")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/anitr-cli" "${pkgdir}/usr/bin/anitr-cli"
}
