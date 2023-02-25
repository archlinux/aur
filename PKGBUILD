# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=otf-mononoki
pkgdesc='Monospace font for programmers, successor of monoOne (OTF version)'
pkgver=1.6
pkgrel=1
arch=(any)
license=(custom:OFL)
url=http://madmalik.github.io/mononoki/
source=("$pkgname-$pkgver.zip::https://github.com/madmalik/mononoki/releases/download/$pkgver/mononoki.zip"
        "https://github.com/madmalik/mononoki/raw/4a4ceb81364158dbb01fdcc30ecf80c65466cb15/LICENSE")
b2sums=('942a2503e816e67c3b031f20fb7428a65c49fa30c72ff6bdf02589bcfe4442de13f552b5cb06ca5fe956f06988f8f292971f95fca5b89851b665f75754026d4b'
        '057fe517fb7db0c1a7b2ffd0edc402a367dff80b216be74e6e6fd4aa367c33eaaba6964fc696deb60fa54c20f4993b50fedfcd4e8d4379f2134878df134da9d3')

package () {
	install -m644 -D -t "$pkgdir/usr/share/fonts/$pkgname" *.otf
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
