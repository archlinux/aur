# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=device-flasher
pkgname=$_pkgname-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Install CalyxOS (binary release)"
url="https://gitlab.com/CalyxOS/device-flasher"
license=('Apache-2.0')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::https://release.calyxinstitute.org/$_pkgname/$pkgver/$_pkgname.linux")
sha256sums=('9c460276906eb6aa5e4c1c65f7fefae9606d37cabe96a923a5642ed1d2b3910e')

package() {
  install -Dm755 $_pkgname-$pkgver "$pkgdir/usr/bin/$_pkgname"
}
