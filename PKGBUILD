# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=device-flasher
pkgname=$_pkgname-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="Install CalyxOS (binary release)"
url="https://gitlab.com/CalyxOS/device-flasher"
license=('Apache-2.0')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::https://release.calyxinstitute.org/$_pkgname/$pkgver/$_pkgname.linux")
sha256sums=('3c318b63d2e93c62e6e3199e58782557a8f19c84f4993a4c80f47028781899f8')

package() {
  install -Dm755 $_pkgname-$pkgver "$pkgdir/usr/bin/$_pkgname"
}
