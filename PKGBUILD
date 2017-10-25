# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=bats
pkgver=1.1.0
pkgrel=1
pkgdesc='Battery status in the console'
url="http://github.com/cdown/$pkgname"
arch=('any')
license=('Public Domain')
depends=()

source=("https://github.com/cdown/${pkgname}/archive/${pkgver}.zip")
md5sums=('3307d535d3443e68054680027381218d')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/bats" \
        "${pkgdir?}/usr/bin/bats"
}
