# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=docker-prune
pkgver=3.0.0
pkgrel=1
pkgdesc="Remove unused docker data which has not been accessed in last 10 days"
arch=('any')
license=('GPL3')
depends=('docker')
source=("docker-prune.service"
        "docker-prune.timer")
sha256sums=('36bdbe45ddef0fd47cc1a26fd5ac3480a90d0092ff149059454f62051d069fdc'
            '4ceebe2d23fc4aa6087e3ec7cf8b9207c67019eb82452eced01585d093fbf28c')

package() {
  install -Dm644 docker-prune.service "$pkgdir"/usr/lib/systemd/system/docker-prune.service
  install -Dm644 docker-prune.timer "$pkgdir"/usr/lib/systemd/system/docker-prune.timer
}
