# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=docker-prune
pkgver=0.0.2
pkgrel=1
pkgdesc="Remove unused docker data which has not been accessed in last 30 days"
arch=('any')
license=('GPL3')
depends=('docker')
source=("docker-prune.service"
        "docker-prune.timer")
sha256sums=('af20f598964c792fc212de160a925a91abb6bb9c29def7f50d0d864639895559'
            'e6bb8c0b0c980c30d7cca1e818c96c0d57f0bd72d219e1bd0af254a561cf8d7a')

package() {
  install -Dm644 docker-prune.service "$pkgdir"/usr/lib/systemd/system/docker-prune.service
  install -Dm644 docker-prune.timer "$pkgdir"/usr/lib/systemd/system/docker-prune.timer
}
