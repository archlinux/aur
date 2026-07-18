# Maintainer: Caleb Maclennan <caleb@alerque.com>
pkgname=keet-bin
_pkgname=${pkgname%-bin}
pkgdesc='Peer-to-Peer encrypted text & video chat'
pkgver=4.19.0
pkgrel=1
arch=(x86_64)
url="https://keet.io"
license=('custom')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!strip)
_archive="${_pkgname^}-$pkgver"
source=("$_archive.tar.gz::https://static.keet.io/downloads/$pkgver/Keet-x64.tar.gz")
sha256sums=('4c94507b351cd97d1fd5ae2d9a95b0a6c08306d8ba8d6390e363110f56f0975a')

package() {
	install -Dm0755 Keet.AppImage "$pkgdir/usr/bin/$_pkgname"
}
