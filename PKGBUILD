# Maintainer: Federico Barcelona <tembleking at gmail dot com>
pkgname=alva
pkgver=0.9.1
pkgrel=1
pkgdesc="Create living prototypes with code components. "
arch=("any")
url="https://meetalva.io/"
license=('MIT')
provides=(alva)
conflicts=(alva-git)
source=("https://github.com/meetalva/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.deb")

package() {
    cd "$srcdir"
    tar xf data.tar.xz -C "$pkgdir"
}

md5sums=('ae11155793bb739f2321181ff928fdb7')
