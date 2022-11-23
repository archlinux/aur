# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=otf-mononoki
pkgdesc='Monospace font for programmers, successor of monoOne (OTF version)'
pkgver=1.5
pkgrel=1
arch=(any)
license=(custom:OFL)
url=http://madmalik.github.io/mononoki/
source=("$pkgname-$pkgver.zip::https://github.com/madmalik/mononoki/releases/download/$pkgver/mononoki.zip"
        "https://github.com/madmalik/mononoki/raw/4a4ceb81364158dbb01fdcc30ecf80c65466cb15/LICENSE")
b2sums=('e018ea288ca701cab3ae46078b96abec5edaad9c5405ea3abc804db3280761efe3079da39a9f5c00f915076dfe4e6811ce7345d287c173bf1e081a8af701e676'
        '057fe517fb7db0c1a7b2ffd0edc402a367dff80b216be74e6e6fd4aa367c33eaaba6964fc696deb60fa54c20f4993b50fedfcd4e8d4379f2134878df134da9d3')

package () {
	install -m644 -D -t "$pkgdir/usr/share/fonts/$pkgname" *.otf
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
