# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=k6-bin
pkgver=0.36.0
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript (precompiled)"
provides=("k6={$pkgver}")
arch=('x86_64')
url="https://github.com/k6io/k6"
license=('AGPL3')
options=(!emptydirs)
source=("https://github.com/k6io/k6/releases/download/v${pkgver}/k6-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('2d934701b55cfd0cd04cd812e74a78b4885b3622d9364d33ef4b3972bf64222d')

package() {
  install -D $srcdir/k6-v${pkgver}-linux-amd64/k6 $pkgdir/usr/bin/k6
}
