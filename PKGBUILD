# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=tcping-go-bin
_pkgname=tcping_Linux
pkgver=2.6.0
pkgrel=1
pkgdesc="Ping TCP ports. Inspired by Linux's ping utility. Written in Go"
arch=('x86_64')
url="https://github.com/pouriyajamshidi/tcping"
license=('MIT')
depends=()
provides=('tcping' 'tcping-go')
conflicts=('tcping-go-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pouriyajamshidi/tcping/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('6f46820e6e683707c20769a34f470b02dbc8d31e6610f5d55f2491248dff8e00')

package() {
	install -D tcping $pkgdir/usr/bin/tcping
}
