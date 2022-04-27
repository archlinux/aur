# Maintainer: 4censord <mail@business-insulting.de>
pkgname=subspace
pkgver=1.5.0
pkgrel=2
epoch=
pkgdesc="A Wireguard management interface"
arch=('x86_64')
url="https://github.com/subspacecommunity/subspace"
license=('GPL')
depends=()
makedepends=('go-bindata' 'go')
provides=($pkgname=$pkgver)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/subspacecommunity/subspace/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1f521e3aad02f02bcc9f018a5ff671bf4a6b9c8613476f7f5b8e3b149c97a0aa')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make build
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 subspace ${pkgdir}/usr/bin/subspace
}
