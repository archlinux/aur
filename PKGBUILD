# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse'
pkgver=v2.7.0
pkgrel=1
pkgdesc="Concourse is a pipeline-based CI system written in Go."
arch=(x86_64)
url="https://concourse.ci/introduction.html"
license=('Apache')
source=(https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64)
sha512sums=('fdbe5a9aa980a097b33f49456a32b66b6148767070fefc1ee0e9c3cd7d8414bdb8d8a154633999c44369e1c550490fcb6fd4a261100ba83b1b56b99840fe6f4b')
provides=('concourse')

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "concourse_linux_amd64" "$pkgdir/usr/bin/concourse"
  chmod ugo+x "$pkgdir/usr/bin/concourse"
}
