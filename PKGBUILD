# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck-bin
_pkgname=milcheck
pkgver=0.1.9
pkgrel=1
pkgdesc="A small binary that displays the status of your pacman mirrorlist in your terminal"
arch=('x86_64')
url="https://github.com/doums/milcheck"
license=('MPL2')
source=("$pkgname-$pkgver::https://github.com/doums/milcheck/releases/download/v${pkgver}/${_pkgname}")
depends=('gcc-libs')
md5sums=('3c088ceae3a1d02ab3211c552e839ef3')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
