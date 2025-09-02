# Maintainer: tee < teeaur at duck dot com >
pkgname=readeck-bin
_pkgname="${pkgname/-bin}"
pkgver=0.20.1
pkgrel=1
pkgdesc="Readeck lets you saves readable content of web pages. It's a bookmark manager and a read later tool like pocket or wallabag"
arch=(x86_64)
url="https://readeck.org"
license=('AGPL-3.0-only')
provides=("$_pkgname")
source=("https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64"
"https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64.sha256")
sha256sums=('9c9e0ddf61eae65cd2369a533947e54ebd3f30e820a4be0fa42590a9bb6aea26'
            '7a4cfb6fc0902f638f96f67129a56fb110ff72cedd2dadad497c178f2af084c2')

package() {
	install -Dm755 "readeck-$pkgver-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}
# vim:set ts=2 sw=2 et:
