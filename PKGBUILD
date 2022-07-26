# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=keet-bin
_pkgname=${pkgname%-bin}
pkgdesc="Peer-to-Peer encrypted text & video chat"
pkgver=1.0.4
pkgrel=1
arch=(x86_64)
url="https://keet.io"
license=('custom')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!strip)
_archive="${_pkgname^}-$pkgver"
source=("$_archive.AppImage::$url/downloads/$pkgver/Keet.AppImage")
sha256sums=('304e5c3f861f15aabc002fa80087c68c13bc14a357ffc3201d884c5ebb8eccee')

package() {
	install -Dm0755 "$_archive.AppImage" "$pkgdir/usr/bin/$_pkgname"
}
