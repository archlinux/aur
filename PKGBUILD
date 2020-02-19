# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=cloudmonkey-bin
_pkgname="${pkgname%-bin}"
_pkgtool=cmk
pkgver=6.0.0
pkgrel=1
pkgdesc='Command line tool for Apache CloudStack'
arch=('x86_64')
_goos=linux
url="https://github.com/apache/cloudstack-$_pkgname"
license=('Apache')
provides=("$_pkgtool")
conflicts=("$_pkgtool")
source=("$pkgname-$pkgver::https://github.com/apache/cloudstack-$_pkgname/releases/download/$pkgver/$_pkgtool.$_goos.x86-64")
sha256sums=('eebc943e3104a4acaa4e61d4029731aea8746fcdfe384262aed6b4a1aba747ac')

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgtool"
}
