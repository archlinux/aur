# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=bats-battery
_pkgname=bats
pkgver=1.2.0
pkgrel=1
pkgdesc='Battery status in the console'
url="http://github.com/cdown/$_pkgname"
arch=('any')
license=('Public Domain')
depends=()

source=("https://github.com/cdown/${_pkgname}/archive/${pkgver}.zip")
md5sums=('90e0cf682045908caa6357c01ea2405b')

package() {
    install -D -m755 \
        "${srcdir?}/$_pkgname-$pkgver/bats" \
        "${pkgdir?}/usr/bin/bats"
}
