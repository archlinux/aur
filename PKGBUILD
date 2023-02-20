# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=docker-prune
pkgver=1.0.0
pkgrel=1
pkgdesc="Remove unused docker data which has not been accessed in last 10 days"
arch=('any')
license=('GPL3')
depends=('docker')
source=("docker-prune.service"
        "docker-prune.timer")
sha256sums=('7e54df7cf6f2f131f0386ea1911e3bbadd67ff691caa542ec8a3fd4a1da8c905'
            '4ceebe2d23fc4aa6087e3ec7cf8b9207c67019eb82452eced01585d093fbf28c')

package() {
  install -Dm644 docker-prune.service "$pkgdir"/usr/lib/systemd/system/docker-prune.service
  install -Dm644 docker-prune.timer "$pkgdir"/usr/lib/systemd/system/docker-prune.timer
}
