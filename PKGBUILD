# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=keet-bin
_pkgname=${pkgname%-bin}
pkgdesc='Peer-to-Peer encrypted text & video chat'
pkgver=2.5.1
pkgrel=1
arch=(x86_64)
url="https://keet.io"
license=('custom')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!strip)
_archive="${_pkgname^}-$pkgver"
source=("$_archive.tar.gz::$url/downloads/$pkgver/Keet-x64.tar.gz")
sha256sums=('6ceeb3c5ba06161d8d8f5e9138983eae58fa3ef41123193afd8d9cd3ed5d2368')

package() {
	install -Dm0755 Keet.AppImage "$pkgdir/usr/bin/$_pkgname"
}
