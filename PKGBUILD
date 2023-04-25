# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=tcping-go-bin
_pkgname=tcping_Linux
pkgver=1.20.0
pkgrel=1
pkgdesc="Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
arch=('x86_64')
url="https://github.com/pouriyajamshidi/tcping"
license=('MIT')
depends=('glibc')
provides=('tcping' 'tcping-go')
conflicts=('tcping' 'tcping-go-git')
source=("https://github.com/pouriyajamshidi/tcping/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('6ae0a1bdcb363fb175d0e92b0e5bee43781e5e28a09d10ddce62ab781f4c249e')

build() {
	tar xvf $_pkgname.tar.gz
}

package() {
	mkdir -p $pkgdir/usr/bin
	install tcping $pkgdir/usr/bin/
}
