# Maintainer: zotan <aur@zotan.email>

pkgname=runitor-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A command runner with healthchecks.io integration"
arch=('x86_64')
url="https://github.com/bdd/runitor"
license=('0BSD')
source=("https://github.com/bdd/runitor/releases/download/v${pkgver}/runitor-v${pkgver}-linux-amd64")
sha512sums=('8012d80c8bc17cfca60d6d1bdafe8390743b4f37d5cf43b0776eaa441d0a375f304c6fe1ccdb0231f1fb5464896f286104c3427ed1b2c8efa45ecb03ed487f64')

package() {
  install -D ${srcdir}/runitor-v${pkgver}-linux-amd64 $pkgdir/usr/bin/runitor
}
