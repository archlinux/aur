# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse-fly'
pkgver=v2.7.3
pkgrel=1
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=(x86_64)
url="https://concourse.ci/fly-cli.html"
license=('Apache')
source=(https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64)
sha512sums=('2d06ac3edb662008c18bc5c4a2c837a8e55400741fe960496ce692988061214a5b6d0a3c33a911abe98e1b6e5cd73c413c22ec731b06f2ac2e52c7f097cce9fd')
provides=('fly')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "fly_linux_amd64" "$pkgdir/usr/bin/fly"
  chmod ugo+x "$pkgdir/usr/bin/fly"
}
