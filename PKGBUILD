# Maintainer: tee < teeaur at duck dot com >
pkgname=readeck-bin
_pkgname="${pkgname/-bin}"
pkgver=0.21.4
pkgrel=1
pkgdesc="Readeck lets you save readable content of web pages. It's a bookmark manager and a read it later tool"
arch=(x86_64)
url="https://readeck.org"
license=('AGPL-3.0-or-later')
provides=("$_pkgname")
source=("https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64"
"https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64.sha256")
sha256sums=('998f77fdadb30907c74f8e5a84c7a50b16b8472078aade2ec75fd0f5ab722cf3'
            '1af280ff3447aba33f681c52781fc7d408f02caff94dbfa6d6ae7ba1b5ef2c11')
package() {
	install -Dm755 "readeck-$pkgver-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}
