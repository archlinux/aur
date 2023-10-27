# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=k6-bin
pkgver=0.47.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=("k6={$pkgver}")
arch=('x86_64')
url="https://github.com/k6io/k6"
license=('AGPL3')
options=(!emptydirs)
source=("https://github.com/k6io/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('596775ba04aa1ea0fa1a50dae465747d47e198f74721f561d4e38f87a700a3ca')

package() {
  install -D $srcdir/k6-v${pkgver}-linux-amd64/k6 $pkgdir/usr/bin/k6
}
