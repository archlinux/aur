# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=device-flasher
pkgname=$_pkgname-bin
pkgver=1.0.10
pkgrel=1
pkgdesc="Install CalyxOS (binary release)"
url="https://gitlab.com/CalyxOS/device-flasher"
license=('Apache-2.0')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::https://release.calyxinstitute.org/$_pkgname/$pkgver/$_pkgname.linux")
sha256sums=('90c306006c8f6ff74a6fc264b85349f9dce4f0e790f673d7c3c8b8a9e083284b')

package() {
  install -Dm755 $_pkgname-$pkgver "$pkgdir/usr/bin/$_pkgname"
}
