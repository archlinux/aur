# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=k6-bin
pkgver=0.41.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=("k6={$pkgver}")
arch=('x86_64')
url="https://github.com/k6io/k6"
license=('AGPL3')
options=(!emptydirs)
source=("https://github.com/k6io/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('49b223997e7ba8749a70ca06ccb8604c44b7d22ad6c481bf966e0d457f17042d')

package() {
  install -D $srcdir/k6-v${pkgver}-linux-amd64/k6 $pkgdir/usr/bin/k6
}
