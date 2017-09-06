# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse'
pkgver=v3.4.1
pkgrel=1
pkgdesc="Concourse is a pipeline-based CI system written in Go."
arch=(x86_64)
url="https://concourse.ci/introduction.html"
license=('Apache')
source=(concourse-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64)
sha512sums=('cb298f8eb684eacf0a2b145cc542518c14e5f314149cfc06cb553bcf6d91ca717370d2a30595f05ea3cb4b3939effcbe2cf67db7adb8f5a4750dae19d0497a23')
provides=('concourse')
depends=('linux-userns')

package() {
  install -Dm755 "concourse-${pkgver}" "$pkgdir/usr/bin/concourse"
}
