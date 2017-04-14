# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse'
pkgver=v2.7.3
pkgrel=1
pkgdesc="Concourse is a pipeline-based CI system written in Go."
arch=(x86_64)
url="https://concourse.ci/introduction.html"
license=('Apache')
source=(https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64)
sha512sums=('265481604ed0a03175dafe190a7b86a3aa6a7b9292ba05209f5e25cb9bd3888c4c76b892eec8adbf586af4654f432b821441a630c0e4be26dcccf910fdcf6b04')
provides=('concourse')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "concourse_linux_amd64" "$pkgdir/usr/bin/concourse"
  chmod ugo+x "$pkgdir/usr/bin/concourse"
}
