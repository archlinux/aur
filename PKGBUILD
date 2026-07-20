# Maintainer: yourusername <your@email.com>

pkgname=archlarp
pkgver=1.0.0
pkgrel=1
pkgdesc="A LARP award trophy for true Arch LARPers"
arch=('any')
url=""
license=('custom')
depends=()
makedepends=()
source=("$pkgname" "$pkgname-opsec" "$pkgname-nonsystemd")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$pkgname-opsec" "$pkgdir/usr/bin/$pkgname-opsec"
  install -Dm755 "$pkgname-nonsystemd" "$pkgdir/usr/bin/$pkgname-nonsystemd"
}
