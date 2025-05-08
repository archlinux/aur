# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=keet-bin
_pkgname=${pkgname%-bin}
pkgdesc='Peer-to-Peer encrypted text & video chat'
pkgver=2.4.1
pkgrel=1
arch=(x86_64)
url="https://keet.io"
license=('custom')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!strip)
_archive="${_pkgname^}-$pkgver"
source=("$_archive.tar.gz::$url/downloads/$pkgver/Keet-x64.tar.gz")
sha256sums=('051d942964e25ba98efd8c270d27697c9a3da6d469704da737729100c8e412b3')

package() {
	install -Dm0755 Keet.AppImage "$pkgdir/usr/bin/$_pkgname"
}
