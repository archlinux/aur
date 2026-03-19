# Maintainer: Bardiya <bardiyafeili@gmail.com>
pkgname=gowall-bin
pkgver=0.2.3
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
  '4b19d65d8ef61ffcfdf6629eedbd89623cd77bc3cffb406b4634e1ae51ee8004'
)

package() {
  install -Dm755 "${srcdir}/gowall" "${pkgdir}/usr/bin/gowall"
}
