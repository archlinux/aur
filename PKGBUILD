# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse-fly'
pkgver=v3.3.1
pkgrel=1
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=(x86_64)
url="https://concourse.ci/fly-cli.html"
license=('Apache')
source=(concourse-fly-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64)
sha512sums=('c819c5351072df64392085fd68802e43546f28bc4adc16494db88b00829c85ba467930fe1617bd32e9e744904415bf02cd4068d7fd700a2c3f9305123210340f')
provides=('fly')

package() {
  install -Dm755 "concourse-fly-${pkgver}" "$pkgdir/usr/bin/fly"
}
