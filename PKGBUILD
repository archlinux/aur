# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=zpotify-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.1
pkgrel=1
pkgdesc="A CLI for Spotify"
arch=('x86_64' 'aarch64')
url="https://github.com/ratakor/$_pkgname"
license=('ISC')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/$pkgver/$CARCH-linux-$_pkgname"
        "$url/raw/master/_$_pkgname")
sha256sums=('SKIP' 'SKIP')

package() {
	install -Dm755 "$CARCH-linux-$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
