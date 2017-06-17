# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse-fly'
pkgver=v3.2.1
pkgrel=1
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=(x86_64)
url="https://concourse.ci/fly-cli.html"
license=('Apache')
source=(concourse-fly-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64)
sha512sums=('38357acdf2e05735462d25989e85f313a1175c5948bf9d46619f95224848b1caf3e4cc863106654de5290687bda3f801acee0a5e0d879de2ec417d6f308181e9')
provides=('fly')

package() {
  install -Dm755 "concourse-fly-${pkgver}" "$pkgdir/usr/bin/fly"
}
