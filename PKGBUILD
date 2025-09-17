# Maintainer: 0x4A4FRN <dfntlynotjon@gmail.com>

pkgname=upstash-redis-local-bin
pkgver=1.0
pkgrel=1
epoch=1
pkgdesc="A local webserver for testing and development using @upstash/redis"
url="https://github.com/DarthBenro008/upstash-redis-local"
license=('MIT')
arch=('x86_64')
provides=('upstash-redis-local')
conflicts=('upstash-redis-local')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/upstash-redis-local_${pkgver}_Linux_${arch}.tar.gz"
)
sha256sums=('0063812fa26e70fb420b8d41235b4e996fa4de53244928c48f7dbfa465173ce8')

package() {
  install -D -m755 "${srcdir}/upstash-redis-local" "${pkgdir}/usr/bin/upstash-redis-local"
}
