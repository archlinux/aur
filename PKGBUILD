# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse'
pkgver=v3.2.1
pkgrel=1
pkgdesc="Concourse is a pipeline-based CI system written in Go."
arch=(x86_64)
url="https://concourse.ci/introduction.html"
license=('Apache')
source=(concourse-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64)
sha512sums=('7e74fc736d2e7ea21b08101097893c461c981f3ef39a3f0ba23504059e8793042fac3474376cd6a64a172a75294ebd456952c2961aa4b92fe0a7c812764e1363')
provides=('concourse')
depends=('linux-userns')

package() {
  install -Dm755 "concourse-${pkgver}" "$pkgdir/usr/bin/concourse"
}
