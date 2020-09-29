# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=goi18n-bin
_pkgname="${pkgname%-bin}"
pkgver=2.1.1
pkgrel=1
pkgdesc='CLI tool that manages message files used by the i18n package'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/nicksnyder/go-i18n'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-$pkgver-$_goos-$_goarch")
sha256sums=(aaf654b09308c928c40a7e8739dd58ad559918a4c686dee5e8992fa74bf1b22b)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
