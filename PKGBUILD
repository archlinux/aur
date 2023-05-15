# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=tcping-go-bin
_pkgname=tcping_Linux
pkgver=1.22.1
pkgrel=1
pkgdesc="Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
arch=('x86_64')
url="https://github.com/pouriyajamshidi/tcping"
license=('MIT')
depends=('glibc')
provides=('tcping' 'tcping-go')
conflicts=('tcping' 'tcping-go-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pouriyajamshidi/tcping/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('3f5b3a64595bde9c14e4ab4d3d9fcc227e7126881376b42551c43e56d1fe77fd')

build() {
	tar xvf $pkgname-$pkgver.tar.gz
}

package() {
	mkdir -p $pkgdir/usr/bin
	install tcping $pkgdir/usr/bin/
}
