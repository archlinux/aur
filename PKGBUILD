# Maintainer: David Flemström <dflemstr@spotify.com>
pkgname=helios-solo
pkgver=0.1.0
pkgrel=1
pkgdesc="Spotify Helios Solo - Docker container orchestration platform in a container"
license=('Apache')

arch=('any')
depends=('docker')
makedepends=()
optdepends=('helios-git: for the "helios" client tool that talks to helios-solo')
source=('helios-solo.service' 'helios-solo-env.sh')
md5sums=('61d7f87d92a1ac5464100501ccec322c'
         '584cdaa52f45e71d6d4dfc6c6c11e02a')

package() {
  install -Dm644 helios-solo.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm755 helios-solo-env.sh -t "$pkgdir/etc/profile.d"
}
