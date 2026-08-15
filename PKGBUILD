# Maintainer: tee < teeaur at duck dot com >
pkgname=readeck-bin
_pkgname="${pkgname/-bin}"
pkgver=0.23.0
pkgrel=1
pkgdesc="Readeck lets you save readable content of web pages. It's a bookmark manager and a read it later tool"
arch=(x86_64)
url="https://readeck.org"
license=('AGPL-3.0-or-later')
provides=("$_pkgname")
source_x86_64=("https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64"
"https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64.sha256")
sha256sums_x86_64=('52d86acaff4cee8bbad4b1bd2778f29bd4f1213fd2206f8fe50383bf03f2d064'
                   '43242efd754393f61203539fed17267650e678df73efdf29f4f276a813dcec0c')
package() {
	install -Dm755 "readeck-$pkgver-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}
