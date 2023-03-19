# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=k6-bin
pkgver=0.43.1
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=("k6={$pkgver}")
arch=('x86_64')
url="https://github.com/k6io/k6"
license=('AGPL3')
options=(!emptydirs)
source=("https://github.com/k6io/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('af9109f2bcaed89248fc6a0c017a4c6df2ce13f49edef37807b9bd61d0679c11')

package() {
  install -D $srcdir/k6-v${pkgver}-linux-amd64/k6 $pkgdir/usr/bin/k6
}
