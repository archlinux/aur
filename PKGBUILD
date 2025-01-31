# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=tcping-go-bin
_pkgname=tcping-linux
pkgver=2.7.1
pkgrel=1
pkgdesc="Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
arch=('x86_64')
_arch=amd64
url="https://github.com/pouriyajamshidi/tcping"
license=('MIT')
depends=()
provides=('tcping' 'tcping-go')
conflicts=('tcping-go-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pouriyajamshidi/tcping/releases/download/v$pkgver/$_pkgname-$_arch-dynamic.tar.gz")
sha256sums=('ae740a2a616a1c5393d492d0484e068ca7d105627ca7ec0423370e159edac034')

package() {
	install -D tcping $pkgdir/usr/bin/tcping
}
