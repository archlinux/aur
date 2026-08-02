# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=tcping-go-bin
_pkgname=tcping-linux
pkgver=2.8.0
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
sha256sums=('13bb55ad630fc6dc29afe9a70da7948ada22871552d10600220bdc06e254fb47')

package() {
	install -D tcping $pkgdir/usr/bin/tcping
}
