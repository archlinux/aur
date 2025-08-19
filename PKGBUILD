# Maintainer: tee < teeaur at duck dot com >
pkgname=readeck-bin
_pkgname="${pkgname/-bin}"
pkgver=0.19.2
pkgrel=2
pkgdesc="Readeck lets you saves readable content of web pages. It's a bookmark manager and a read later tool like pocket or shiori."
arch=(x86_64)
url="https://readeck.org"
license=('AGPL-3.0-only')
provides=("$_pkgname")
source=("https://codeberg.org/readeck/readeck/releases/download/$pkgver/readeck-$pkgver-linux-amd64")
sha256sums=('e215c5e869b84e7a14d6d1d981e0651fa5e126cfead5b15925dcb0d0e9f33943')

package() {
	install -Dm755 "readeck-$pkgver-linux-amd64" "$pkgdir/usr/bin/$_pkgname"
}
# vim:set ts=2 sw=2 et:
