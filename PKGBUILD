# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=milcheck-bin
_pkgname=milcheck
pkgver=0.2.1
pkgrel=1
pkgdesc="A small binary that displays the status of your pacman mirrorlist in your terminal"
arch=('x86_64')
url="https://github.com/doums/milcheck"
license=('MPL2')
source=("$pkgname-$pkgver::https://github.com/doums/milcheck/releases/download/v${pkgver}/${_pkgname}")
depends=('openssl')
md5sums=('72c5800b95b129fdd736b476c161e012')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
