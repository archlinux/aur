# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse'
pkgver=v3.5.0
pkgrel=1
pkgdesc="Concourse is a pipeline-based CI system written in Go."
arch=(x86_64)
url="https://concourse.ci/introduction.html"
license=('Apache')
source=(concourse-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64)
sha512sums=('2fa82213e009dea8f0369aea4a330c33a955c1c27421926211c9d43c8f69dab024014174b534b9d494f5eaad48dce3621dee99ce1f887c7a12de36fb905d5b3e')
provides=('concourse')
depends=('linux-userns')

package() {
  install -Dm755 "concourse-${pkgver}" "$pkgdir/usr/bin/concourse"
}
