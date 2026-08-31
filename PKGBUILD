# Maintainer: tee < teeaur at duck dot com >
pkgname=readeck-bin
_pkgname="${pkgname/-bin}"
pkgver=0.23.2
pkgrel=1
pkgdesc="Readeck lets you save readable content of web pages. It's a bookmark manager and a read it later tool"
arch=(x86_64)
url="https://readeck.org"
license=('AGPL-3.0-or-later')
provides=("$_pkgname")
source_x86_64=("https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64"
"https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64.sha256")
sha256sums_x86_64=('39fc1c52afa5a96ee2cbf44c866fdb97260d8a84fb6abb8030f843830ccd93fd'
                   'bb8fee94c3125aab626400ad725e128dfc6180050383326b5a130c36a97cb1b2')
package() {
	install -Dm755 "readeck-$pkgver-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}
