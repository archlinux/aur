# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse'
pkgver=v3.0.1
pkgrel=1
pkgdesc="Concourse is a pipeline-based CI system written in Go."
arch=(x86_64)
url="https://concourse.ci/introduction.html"
license=('Apache')
source=(https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64)
sha512sums=('b1404d5cb163367aaed2abef6a70c55daf149efc6cbe99d370d45494af040084edc52a32b5ccfd9f7785b6be321f1765f06b54db3e5c96e42b95dee01a250a68')
provides=('concourse')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "concourse_linux_amd64" "$pkgdir/usr/bin/concourse"
  chmod ugo+x "$pkgdir/usr/bin/concourse"
}
