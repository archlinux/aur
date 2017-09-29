# Maintainer: Bram Swenson <bram@amplified.work>

pkgname_base='concourse-fly'
pkgname="${pkgname_base}-bin"
pkgver=v3.5.0
pkgrel=1
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=(x86_64)
url="https://concourse.ci/fly-cli.html"
license=('Apache')
source=(concourse-fly-bin-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64)
sha512sums=('12aaeb0e8065b66b055ad8be9014334cfcf7d24f84a0bf6ecd1544f52a3e891ff7bc492dd57e36a78100b64610a9cf066bd3470dccef01888ec538a95715cc24')
provides=('fly')

package() {
  install -Dm755 "concourse-fly-bin-${pkgver}" "$pkgdir/usr/bin/fly"
}
