# Maintainer: Bram Swenson <bram@amplified.work>

pkgname='concourse'
pkgver=v3.3.1
pkgrel=1
pkgdesc="Concourse is a pipeline-based CI system written in Go."
arch=(x86_64)
url="https://concourse.ci/introduction.html"
license=('Apache')
source=(concourse-${pkgver}::https://github.com/concourse/concourse/releases/download/${pkgver}/concourse_linux_amd64)
sha512sums=('9fa3bd4ae0c0e8e22a498633625e69040a66ea3f4f4c9c072cbc19963a6947c4a2d12d9f3cdbe368d730469f8ebf1dabcb242c40cb702804bd6d0363b296f1c1')
provides=('concourse')
depends=('linux-userns')

package() {
  install -Dm755 "concourse-${pkgver}" "$pkgdir/usr/bin/concourse"
}
