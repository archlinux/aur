# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse-fly'
pkgver=v3.1.1
pkgrel=1
pkgdesc="A command line interface that runs a build in a container with ATC."
arch=(x86_64)
url="https://concourse.ci/fly-cli.html"
license=('Apache')
source=(concourse-fly-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/fly_linux_amd64)
sha512sums=('e9562a163327b74c7d8bba7a68e2d90adb7a01ee0b5e149718fca823338a1a13dfcf502377a912a588a9bc9e09fe9da19e2eec22c5ba72ae36ee5f2c5bf14844')
provides=('fly')

package() {
  install -Dm755 "concourse-fly-${pkgver}" "$pkgdir/usr/bin/fly"
}
