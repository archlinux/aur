# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nexttrace-bin
pkgver=1.6.5
_tag=v$pkgver
pkgrel=1
provides=('nexttrace')
conflicts=('nexttrace')
pkgdesc='An open source visual route tracking CLI tool'
arch=('x86_64')
url='https://github.com/nxtrace/NTrace-core'
license=('GPL-3.0-only')
install=nexttrace.install
source=("$pkgname-$pkgver::$url/releases/download/$_tag/nexttrace_linux_amd64")
sha256sums=('32e4b43ba72709d8cb16585194315cf316d376cbd14013c58cece90d3764e090')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nexttrace"
}
