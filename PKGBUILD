# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=bats
pkgver=1.0.0
pkgrel=1
pkgdesc='Battery status in the console'
url="http://github.com/cdown/$pkgname"
arch=('any')
license=('Public Domain')
depends=()

source=("https://github.com/cdown/${pkgname}/archive/${pkgver}.zip")
md5sums=('526c14e1fb4207e841d5a63532f3b8d9')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/bats" \
        "${pkgdir?}/usr/bin/bats"
}
