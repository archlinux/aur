# Maintainer: Rob McFadzean <root@sphericalcube.net>

pkgname=docker-machine-vultr
pkgver=1.4.0
pkgrel=1
pkgdesc="Vultr driver for docker-machine"
url="https://github.com/janeczku/docker-machine-vultr/"
license=('MIT')
arch=('x86_64')
depends=(
  'docker-machine'
)
optdepends=(
  'docker: to manage the containers in the machine'
)
makedepends=()

source=("https://github.com/janeczku/docker-machine-vultr/releases/download/v$pkgver/docker-machine-driver-vultr-Linux-$CARCH")
sha256sums=('6e07f18f019d6d73089f09fe858e84a1a1ca37ca74d76f6bb918d63e021ee3d7')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 docker-machine-driver-vultr "$pkgdir/usr/bin/docker-machine-driver-vultr"
}
