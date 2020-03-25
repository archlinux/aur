# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=calories-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Calories Tracker for the Commandline'
arch=('x86_64')
url="https://github.com/zupzup/calories"
license=('MIT')
provides=('calories')
source=("${url}/releases/download/${pkgver}/calories_${pkgver}_linux_64-bit.tar.gz")
md5sums=('9f8e931dbcc40930c07e496f8b3b440e')

package() {
  install -Dm755 ${srcdir}/calories "${pkgdir}/usr/bin/calories"
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/calories/LICENSE"
}
# vim:set ts=2 sw=2 et: