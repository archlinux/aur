# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=tcping-go-bin
_pkgname=tcping_Linux
pkgver=1.19.1
pkgrel=1
pkgdesc="Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
arch=('x86_64')
url="https://github.com/pouriyajamshidi/tcping"
license=('MIT')
depends=('glibc')
provides=('tcping' 'tcping-go')
conflicts=('tcping' 'tcping-go-git')
source=("https://github.com/pouriyajamshidi/tcping/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('7d943042ef586b860519496fa566341efafc0fd32ef4abbabd5db42c6081eac8') #autofill using updpkgsums

build() {
	tar xvf $_pkgname.tar.gz
}

package() {
	mkdir -p $pkgdir/usr/bin
	install tcping $pkgdir/usr/bin/
}
