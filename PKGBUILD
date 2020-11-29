# Maintainer: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.22.1
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source=("$pkgname-x86_64-$pkgver.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz")
sha256sums=('1fba9a9154bd05db707e2e0b9c825e32eeb7487e7bccecc12baa5d441b90844f')

package() {
  cd dolt-linux-amd64
  install -D -t $pkgdir/usr/bin/ bin/{dolt,git-dolt,git-dolt-smudge}
}
