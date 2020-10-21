# Maintainer: Pierre Dommerc <dommerc.pierre@gmail.com>

pkgname=bato-bin
_pkgname=bato
pkgver=0.1.3
pkgrel=1
pkgdesc="Small program to send battery notifications"
arch=('x86_64')
url="https://github.com/doums/bato"
license=('MPL2')
source=("$pkgname-$pkgver::https://github.com/doums/bato/releases/download/v${pkgver}/${_pkgname}")
depends=('libnotify')
md5sums=('1754df42f62392d82539ffb1e0e093c9')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
