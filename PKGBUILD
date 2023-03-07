# Maintainer: xotkot
# Contributor: Shayne Hartford <shayneehartford@gmail.com>

pkgname=jj-bin
_pkgname=jj
pkgver=1.9.2
pkgrel=1
pkgdesc="JSON Stream Editor (command line utility)"
arch=('x86_64')
license=('MIT')
url="https://github.com/tidwall/jj"
source=(https://github.com/tidwall/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz)
b2sums=('06f4d1c841db44a4aef0b14bffff4207decda2111448b683e6c8f11b72588b70154a68f7b1ad1bbe4a843ff5890c1adda5966a59a414f7f6d74daefc878e33a2')

package() {
    cd "$srcdir/$_pkgname-$pkgver-linux-amd64"

	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
