# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=keet-bin
_pkgname=${pkgname%-bin}
pkgdesc='Peer-to-Peer encrypted text & video chat'
pkgver=2.0.0
pkgrel=1
arch=(x86_64)
url="https://keet.io"
license=('custom')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!strip)
_archive="${_pkgname^}-$pkgver"
source=("$_archive.tar.gz::$url/downloads/$pkgver/Keet-x64.tar.gz")
sha256sums=('1212e718901d63aeefcba4c29e9ba23792be49879ed79becb58f5e8840300650')

package() {
	install -Dm0755 Keet.AppImage "$pkgdir/usr/bin/$_pkgname"
}
