# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=todobg
pkgver=0.1.0
pkgrel=1
pkgdesc='Todo list on the X root window'
url="http://github.com/cdown/$pkgname"
arch=('any')
license=('Public Domain')
depends=()

source=("https://github.com/cdown/${pkgname}/archive/refs/tags/${pkgver}.zip")
md5sums=('b5836549cc01b9d67b5ef1555fd0ff88')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/todobg" \
        "${pkgdir?}/usr/bin/todobg"
    install -D -m644 \
        "${srcdir?}/$pkgname-$pkgver/todobg.service" \
        "${pkgdir?}/usr/lib/systemd/user/todobg.service"
}
