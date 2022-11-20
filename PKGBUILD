# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=keet-bin
_pkgname=${pkgname%-bin}
pkgdesc="Peer-to-Peer encrypted text & video chat"
pkgver=1.2.0
pkgrel=1
arch=(x86_64)
url="https://keet.io"
license=('custom')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
_archive="${_pkgname^}-$pkgver"
source=("$_archive.AppImage::$url/downloads/$pkgver/Keet.AppImage")
sha256sums=('6b94a0d75d2c3f4c3deed62dd4b55f73cf95bd49ae17100565f2aa13a906f572')

package() {
	install -Dm0755 "$_archive.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
