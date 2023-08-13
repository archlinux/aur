# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=tcping-go-bin
_pkgname=tcping_Linux
pkgver=2.0.0
pkgrel=1
pkgdesc="Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
arch=('x86_64')
url="https://github.com/pouriyajamshidi/tcping"
license=('MIT')
depends=()
provides=('tcping' 'tcping-go')
conflicts=('tcping' 'tcping-go-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pouriyajamshidi/tcping/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('0ac4051647c09314c029ac0ef8089699879d75686f0c437cb4d70cdc5e1098f7')

build() {
	tar xvf $pkgname-$pkgver.tar.gz
}

package() {
	install -D tcping $pkgdir/usr/bin/tcping
}
