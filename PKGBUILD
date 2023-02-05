# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=keet-bin
_pkgname=${pkgname%-bin}
pkgdesc="Peer-to-Peer encrypted text & video chat"
pkgver=1.2.1
pkgrel=1
arch=(x86_64)
url="https://keet.io"
license=('custom')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
_archive="${_pkgname^}-$pkgver"
source=("$_archive.AppImage::$url/downloads/$pkgver/Keet.AppImage")
sha256sums=('1f76ccfa16719a24f6d84b88e5ca49fab1c372de309ce74393461903c5c49d98')

package() {
	install -Dm0755 "$_archive.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
