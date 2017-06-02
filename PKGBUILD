# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse'
pkgver=v3.1.1
pkgrel=1
pkgdesc="Concourse is a pipeline-based CI system written in Go."
arch=(x86_64)
url="https://concourse.ci/introduction.html"
license=('Apache')
source=(concourse-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64)
sha512sums=('0e46849470c672baeab0bc09fcd99101fcf9b6c29ef8516e3fb45a63e4b8099e2a8fdc0bb97325bbd2d6020840653016277a88e28d36979548b53efcc5896637')
provides=('concourse')
depends=('linux-userns')

package() {
  install -Dm755 "concourse-${pkgver}" "$pkgdir/usr/bin/concourse"
}
