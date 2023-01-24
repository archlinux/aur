# Maintainer: Olivia <olmay@tuta.io>
pkgname=livsdiary
pkgver=1.1.1
pkgrel=2
pkgdesc="A simple, free and open source command-line diary"
arch=('x86_64')
url="https://github.com/olivia-livs/$pkgname"
license=('GPL3')
source=("https://github.com/olivia-livs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0d8575246b4149c4a11499992d9aa73036c963f310d7d3331b5d9548453b6a44')

build() {
        cd "$pkgname-$pkgver"
        make
}

package() {
        cd "$pkgname-$pkgver"
        install -D livsdiary "${pkgdir}/usr/bin/livsdiary"
}
