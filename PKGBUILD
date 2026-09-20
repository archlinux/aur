# Maintainer: tee < teeaur at duck dot com >
pkgname=readeck-bin
_pkgname="${pkgname/-bin}"
pkgver=0.23.4
pkgrel=1
pkgdesc="Readeck lets you save readable content of web pages. It's a bookmark manager and a read it later tool"
arch=(x86_64)
url="https://readeck.org"
license=('AGPL-3.0-or-later')
provides=("$_pkgname")
source_x86_64=("https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64"
"https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64.sha256")
sha256sums_x86_64=('18652e49cced19b893f26d6150859c394ba503d6b5e4d9fbdff6cc035a2bada4'
                   '2e190911bddb5098706c77c221eb9d1223abd94c641c5ee99e8049e2734c1161')
package() {
	install -Dm755 "readeck-$pkgver-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}
