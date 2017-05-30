# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse-fly'
pkgver=v3.0.1
pkgrel=1
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=(x86_64)
url="https://concourse.ci/fly-cli.html"
license=('Apache')
source=(https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64)
sha512sums=('bf63d30a0601b987bdaf5bac4fc6b866f0c6ac3fb826704e81c1f9dfc265a8d57e205d771daa297f46071609b60c4ed58f62f7d9abaa7442bc91647e023d3c2d')
provides=('fly')
depends=("linux-userns")

package() {
  install -Dm755 "fly_linux_amd64" "$pkgdir/usr/bin/fly"
}
