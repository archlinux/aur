# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=bato-bin
_pkgname=bato
pkgver=0.1.1
pkgrel=1
pkgdesc="Small program to send battery notifications"
arch=('x86_64')
url="https://github.com/doums/bato"
license=('MPL2')
source=("$pkgname-$pkgver::https://github.com/doums/bato/releases/download/v${pkgver}/${_pkgname}")
depends=('libnotify')
md5sums=('9a776b90bbb47228c71bb0aacc31d936')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
