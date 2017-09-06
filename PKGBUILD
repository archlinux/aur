# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse-fly'
pkgver=v3.4.1
pkgrel=1
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=(x86_64)
url="https://concourse.ci/fly-cli.html"
license=('Apache')
source=(concourse-fly-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64)
sha512sums=('ecd77682abcdfd9973c0a58e3ea64dceb06dd04d58d0d6d925bcd8e4b5f1623e6c73fe75a01a4cb5537b8596cd6a11670290fa01c34295a0c1f9a45cda8c567d')
provides=('fly')

package() {
  install -Dm755 "concourse-fly-${pkgver}" "$pkgdir/usr/bin/fly"
}
