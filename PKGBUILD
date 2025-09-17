# Maintainer: tee < teeaur at duck dot com >
pkgname=readeck-bin
_pkgname="${pkgname/-bin}"
pkgver=0.20.3
pkgrel=1
pkgdesc="Readeck lets you saves readable content of web pages. It's a bookmark manager and a read it later tool"
arch=(x86_64)
url="https://readeck.org"
license=('AGPL-3.0-only')
provides=("$_pkgname")
source=("https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64"
"https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64.sha256")
sha256sums=('318386f9a2ecda3039932c5139892c41824bbc2cc7a05d0c750bfc8f3f0f7ceb'
            '16c334484748d13a649705f7712bad2a04b9fea1f1bc4e2044fa9cdfc43bbb75')
package() {
	install -Dm755 "readeck-$pkgver-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}
