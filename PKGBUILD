# Maintainer: wDona <donanferyt@gmail.com>
pkgname=burnt-out
pkgver=1.0.01
pkgrel=1
pkgdesc="To-do app focused on preventing Burnout Syndrome ;)"
arch=('x86_64')
url="https://github.com/wDona/Burnt-out"
license=('MIT')
depends=('java-runtime')
source_x86_64=("https://github.com/wDona/Burnt-out/releases/download/v${pkgver}/${pkgname}-${pkgver}-installer.deb")
sha256sums_x86_64=('SKIP')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.* -C "$pkgdir/"
}
