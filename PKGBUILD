# Maintainer: tee < teeaur at duck dot com >
pkgname=readeck-bin
_pkgname="${pkgname/-bin}"
pkgver=0.23.6
pkgrel=1
pkgdesc="Readeck lets you save readable content of web pages. It's a bookmark manager and a read it later tool"
arch=(x86_64)
url="https://readeck.org"
license=('AGPL-3.0-or-later')
provides=("$_pkgname")
source_x86_64=("https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64"
"https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64.sha256")
sha256sums_x86_64=('247d8f8c8423c7103df3838660ca2e2405f9ed961391c5318286b25935cca038'
                   '3a5928f24d0341050b6de4f0975b710b2b8dffae25581602620633fe322164aa')
package() {
	install -Dm755 "readeck-$pkgver-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}
