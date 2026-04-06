pkgname=spex-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Wallpaper-based dynamic color generator"
arch=('x86_64')
url="https://github.com/Grey-007/spex"
license=('MIT')
depends=()
provides=('spex')
conflicts=('spex')
source=("https://github.com/Grey-007/spex/releases/download/v${pkgver}/spex-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('SKIP')

options=('!debug')

package() {
  install -Dm755 spex "$pkgdir/usr/bin/spex"
  install -Dm755 spex-convert "$pkgdir/usr/bin/spex-convert"
}
