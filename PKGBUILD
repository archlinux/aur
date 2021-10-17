# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=cloudmonkey-bin
_pkgname="cmk"
_pkgtool=cmk
pkgver=6.2.0
pkgrel=1
pkgdesc='Command line tool for Apache CloudStack'
arch=('x86_64')
_goos=linux
url="https://github.com/apache/cloudstack-${pkgname%-bin}"
license=('Apache')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/$_pkgname.$_goos.${arch/_/-}")
b2sums=(d7e2fed751a12710027084f5e9cc82a48f7f63ea36c4a483063c3c76267c56f9af28217eab980d386d853fb4d9a149f5c5c8fab1c2010472c7262755e6ff9da2)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
