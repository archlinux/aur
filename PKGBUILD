# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=device-flasher
pkgname=$_pkgname-bin
pkgver=1.0.8
pkgrel=1
pkgdesc="Install CalyxOS (binary release)"
url="https://gitlab.com/CalyxOS/device-flasher"
arch=('x86_64')
license=('Apache2')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::https://release.calyxinstitute.org/$_pkgname/$pkgver/$_pkgname.linux")
sha256sums=('f1385d51a9042cf1b7ef434475da2b7d007ec68665af44ef9ae1cc6df4771b1b')

package() {
  install -Dm755 $_pkgname-$pkgver "$pkgdir/usr/bin/$_pkgname"
}
