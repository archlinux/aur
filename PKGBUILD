# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse-fly'
pkgver=v2.7.0
pkgrel=1
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=(x86_64)
url="https://concourse.ci/fly-cli.html"
license=('Apache')
source=(https://github.com/concourse/concourse/releases/download/v2.7.0/fly_linux_amd64)
sha512sums=('0ce31f3b004ef2ff1925a84a2bb5b626ffb15ee88c1b662c1cc784d020250560e6eff000dc8c21a931aba1a4e039c6d3e60c67062496b6905c31ea646218f257')
provides=('fly')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "fly_linux_amd64" "$pkgdir/usr/bin/fly"
  chmod ugo+x "$pkgdir/usr/bin/fly"
}
