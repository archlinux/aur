# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipmenu
pkgver=1.2.2
pkgrel=1
pkgdesc='Clipboard management using dmenu'
url='http://github.com/cdown/clipmenu'
arch=('any')
license=('ISC')
depends=(dmenu xsel)
conflicts=(clipmenu-git)  # Old package from pre-AUR4 days

source=("https://github.com/cdown/clipmenu/archive/${pkgver}.zip")
md5sums=('852a224a1135e31b837ac39fcdad1a4c')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/clipmenu" \
        "${pkgdir?}/usr/bin/clipmenu"
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/clipmenud" \
        "${pkgdir?}/usr/bin/clipmenud"
}
