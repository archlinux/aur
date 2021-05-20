# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: Dominik Braun <mail at dominikbraun dot io>

pkgname=timetrace-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple CLI for tracking your working time."
arch=("x86_64")
url="https://github.com/dominikbraun/timetrace"
license=("Apache")
source=("https://github.com/dominikbraun/timetrace/releases/download/v$pkgver/timetrace-linux-amd64.tar.gz")
sha256sums=('5fa37e7d5e5e7fa3ad9e94f10151aaec850fdb0ac3a63c92485f974c4e5ae9cc')

depends=()
optdepends=()

package() {
    install -D "$srcdir/timetrace" "$pkgdir/usr/bin/timetrace"
}
