# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=tcping-go-bin
_pkgname=tcping_Linux
pkgver=2.4.0
pkgrel=1
pkgdesc="Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
arch=('x86_64')
url="https://github.com/pouriyajamshidi/tcping"
license=('MIT')
depends=()
provides=('tcping' 'tcping-go')
conflicts=('tcping' 'tcping-go-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pouriyajamshidi/tcping/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('4fe818728f9ca8a8b4c9e5db66d415270f45672884a07cccd765db2b74c45130')

package() {
	install -D tcping $pkgdir/usr/bin/tcping
}
