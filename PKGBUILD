# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=leaps-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A service for collaboratively editing your local files over a web UI, using operational transforms to ensure zero-collision synchronization across any number of editing clients"
arch=('x86_64')
url='https://github.com/Jeffail/leaps'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/leaps_linux_amd64.tar.gz")
sha256sums=('81a4dbb42fecf25b6728ba6ebc1225bb2e65ae949e8d0827e629c95acd463765')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}_linux_amd64/bin/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
}