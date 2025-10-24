# Maintainer: Jett Scythe
pkgname=wifitui-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI."
arch=('x86_64')
url="https://github.com/shazow/wifitui"
license=('MIT')
source=("https://github.com/shazow/wifitui/releases/download/v${pkgver}/wifitui_${pkgver}_linux_${CARCH}.pkg.tar.zst")
sha256sums=('007a45952a52cf9dc34e29cfb173305bd5fbb645a7a7d47881e3238feefcaf14')

package() {
  cd "$srcdir"
  install -Dm755 usr/bin/wifitui "$pkgdir/usr/bin/wifitui"
}
