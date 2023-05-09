# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=tcping-go-bin
_pkgname=tcping_Linux
pkgver=1.21.2
pkgrel=2
pkgdesc="Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
arch=('x86_64')
url="https://github.com/pouriyajamshidi/tcping"
license=('MIT')
depends=('glibc')
provides=('tcping' 'tcping-go')
conflicts=('tcping' 'tcping-go-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pouriyajamshidi/tcping/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('c4994dd990a34b12bc48902d7d3810b3f38d6e66c886c89a0b22840f0691d3af')

build() {
	tar xvf $pkgname-$pkgver.tar.gz
}

package() {
	mkdir -p $pkgdir/usr/bin
	install tcping $pkgdir/usr/bin/
}
