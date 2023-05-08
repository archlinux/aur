# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=tcping-go-bin
_pkgname=tcping_Linux
pkgver=1.21.0
pkgrel=1
pkgdesc="Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
arch=('x86_64')
url="https://github.com/pouriyajamshidi/tcping"
license=('MIT')
depends=('glibc')
provides=('tcping' 'tcping-go')
conflicts=('tcping' 'tcping-go-git')
source=("https://github.com/pouriyajamshidi/tcping/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('d6c905650072a65ed9cbfab76fedd7517023efe4033a2ca63c1faf50b8a54ce7')

build() {
	tar xvf $_pkgname.tar.gz
}

package() {
	mkdir -p $pkgdir/usr/bin
	install tcping $pkgdir/usr/bin/
}
