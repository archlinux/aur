# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=prompter
pkgver=0.1.0
pkgrel=1
pkgdesc='Dumb prompter'
url="http://github.com/cdown/$pkgname"
arch=('any')
license=('Public Domain')
depends=()

source=("https://github.com/cdown/${pkgname}/archive/${pkgver}.zip")
md5sums=('cf94c7edb62574fc0167ee2339aa96a6')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/prompter" \
        "${pkgdir?}/usr/bin/prompter"
}
