# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=calories-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Calories Tracker for the Commandline'
arch=('x86_64')
url="https://github.com/zupzup/calories"
license=('MIT')
provides=('calories')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/calories_${pkgver}_linux_64-bit.tar.gz")
sha256sums=('73e8ddc6234da25c512667760b8d563c5fbc259f88d2fc32a44a93656c2ae05b')

package() {
  install -Dm755 ${srcdir}/calories "${pkgdir}/usr/bin/calories"
  install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: