# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=prompter
pkgver=0.2.0
pkgrel=1
pkgdesc='Dumb prompter'
url="http://github.com/cdown/$pkgname"
arch=('any')
license=('Public Domain')
depends=()

source=("https://github.com/cdown/${pkgname}/archive/${pkgver}.zip")
md5sums=('1f21783af14c41a23043b9c111d0ed5e')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/prompter" \
        "${pkgdir?}/usr/bin/prompter"
    install -D -m644 \
        "${srcdir?}/$pkgname-$pkgver/prompter.service" \
        "${pkgdir?}/usr/lib/systemd/user/prompter.service"
}
