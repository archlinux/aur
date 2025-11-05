# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=keet-bin
_pkgname=${pkgname%-bin}
pkgdesc='Peer-to-Peer encrypted text & video chat'
pkgver=2.5.2
pkgrel=1
arch=(x86_64)
url="https://keet.io"
license=('custom')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!strip)
_archive="${_pkgname^}-$pkgver"
source=("$_archive.tar.gz::https://static.keety.io/downloads/$pkgver/Keet-x64.tar.gz")
sha256sums=('cb42f2fb6db6e4214d84ba1e9ccdbd78b55aa48f25be97ec5b3a59e64ec57202')

package() {
	install -Dm0755 Keet.AppImage "$pkgdir/usr/bin/$_pkgname"
}
