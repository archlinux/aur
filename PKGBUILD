# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=goi18n-bin
_pkgname="${pkgname%-bin}"
pkgver=2.1.1
pkgrel=2
pkgdesc='CLI tool that manages message files used by the i18n package'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://github.com/nicksnyder/go-i18n'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/$_pkgname-$pkgver-$_goos-$_goarch")
sha256sums=(63b071b690ee99b5d34ba81a275e9463dbc2db4d9cf40cd42f8c2dd2a20ab4e7)

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
