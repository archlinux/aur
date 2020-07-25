# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=cloudmonkey-bin
_pkgname="${pkgname%-bin}"
_pkgtool=cmk
pkgver=6.1.0
pkgrel=1
pkgdesc='Command line tool for Apache CloudStack'
arch=('x86_64')
_goos=linux
url="https://github.com/apache/cloudstack-$_pkgname"
license=('Apache')
provides=("$_pkgtool")
conflicts=("$_pkgtool")
source=("$pkgname-$pkgver::https://github.com/apache/cloudstack-$_pkgname/releases/download/$pkgver/$_pkgtool.$_goos.x86-64")
sha256sums=(d745900b0f14e9bd35d961c7649d9eb46e7b394c67f45f5f02ce0141bef23df6)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgtool"
}
