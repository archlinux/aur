# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck-bin
_pkgname=milcheck
pkgver=0.2.2
pkgrel=1
pkgdesc="A small binary that displays the status of your pacman mirrorlist in your terminal"
arch=('x86_64')
url="https://github.com/doums/milcheck"
license=('MPL2')
source=("$pkgname-$pkgver::https://github.com/doums/milcheck/releases/download/v${pkgver}/${_pkgname}")
depends=('openssl' 'gcc-libs')
md5sums=('b708fe684a0e7f1f31e1f4e166a955ed')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
