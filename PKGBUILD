# Maintainer: Olivia <olmay@tuta.io>
pkgname=livsdiary
pkgver=1.1.1
pkgrel=1
pkgdesc="A simple, free and open source command-line diary"
arch=('x86_64')
url="https://github.com/olivia-livs/$pkgname"
license=('GPL3')
source=("https://github.com/olivia-livs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('83771eefba15e4e1996e900cdd1509e44a1e24348621bad026a3ff8f8094b306')

build() {
        cd "$pkgname-$pkgver"
        make
}

package() {
        cd "$pkgname-$pkgver"
        install -D livsdiary "${pkgdir}/usr/bin/livsdiary"
}
