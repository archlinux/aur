# Maintainer: Bardiya <bardiyafeili@gmail.com>
pkgname=gowall-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="A tool to convert a Wallpaper's color scheme - palette"
arch=('x86_64')
url="https://github.com/Achno/gowall"
license=('MIT')
depends=('glibc')
provides=('gowall')
conflicts=('gowall')
source_x86_64=(
  "gowall-amd64-linux.tar.gz::https://github.com/Achno/gowall/releases/download/v${pkgver}/gowall-amd64-linux.tar.gz"
)
sha256sums_x86_64=(
  'dab486d5028e5f790fbd92dd26022ac5670b0d01adef4bd632ba7115c2d34ad3'
)

package() {
  install -Dm755 "${srcdir}/gowall" "${pkgdir}/usr/bin/gowall"
}
