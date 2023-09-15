# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=k6-bin
pkgver=0.46.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=("k6={$pkgver}")
arch=('x86_64')
url="https://github.com/k6io/k6"
license=('AGPL3')
options=(!emptydirs)
source=("https://github.com/k6io/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('7b52001d02315a799c275103e09c8f5b8ccaf471512bb4b52387d82c938093eb')

package() {
  install -D $srcdir/k6-v${pkgver}-linux-amd64/k6 $pkgdir/usr/bin/k6
}
