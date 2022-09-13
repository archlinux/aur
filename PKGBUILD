# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=otf-mononoki
pkgdesc='Monospace font for programmers, successor of monoOne (OTF version)'
pkgver=1.4
pkgrel=1
arch=(any)
license=(custom:OFL)
url=http://madmalik.github.io/mononoki/
source=("$pkgname-$pkgver.zip::https://github.com/madmalik/mononoki/releases/download/$pkgver/mononoki.zip"
        "https://github.com/madmalik/mononoki/raw/4a4ceb81364158dbb01fdcc30ecf80c65466cb15/LICENSE")
b2sums=('78b37f622fbafcb9997f945b8623ae3776f3544956e21643b07bf8709306f6367ca93eed9b2c4fd74ae0fc4cf4a5964cdc60a73b5cb9fef10e026d83add8ef43'
        '057fe517fb7db0c1a7b2ffd0edc402a367dff80b216be74e6e6fd4aa367c33eaaba6964fc696deb60fa54c20f4993b50fedfcd4e8d4379f2134878df134da9d3')

package () {
	install -m644 -D -t "$pkgdir/usr/share/fonts/$pkgname" *.otf
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
