# Maintainer: Brad Erhart <brae dot 04 plus aur at gmail dot com>

pkgname=goi18n-bin
_pkgname="${pkgname%-bin}"
pkgver=2.0.3
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
sha256sums=('f85386a3d8e2fc65dcfa940134bbee65af7bfc8e502b0db36c20190bd11b98a7')

package() {
	install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
