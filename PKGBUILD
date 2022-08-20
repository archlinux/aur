# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=keet-bin
_pkgname=${pkgname%-bin}
pkgdesc="Peer-to-Peer encrypted text & video chat"
pkgver=1.0.5
pkgrel=1
arch=(x86_64)
url="https://keet.io"
license=('custom')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
_archive="${_pkgname^}-$pkgver"
source=("$_archive.AppImage::$url/downloads/$pkgver/Keet.AppImage")
sha256sums=('982dfc3b25d596a93785fbea72bb39901cf919296ab32cda0af44c769b99c472')

package() {
	install -Dm0755 "$_archive.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
