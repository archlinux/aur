# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipmenu
pkgver=2.0.0
pkgrel=1
pkgdesc='Clipboard management using dmenu'
url='http://github.com/cdown/clipmenu'
arch=('any')
license=('ISC')
depends=(dmenu xsel)
conflicts=(clipmenu-git)  # Old package from pre-AUR4 days

source=("https://github.com/cdown/clipmenu/archive/${pkgver}.zip")
md5sums=('273b82d214056a7ed534b4a7027829c1')

package() {
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/clipmenu" \
        "${pkgdir?}/usr/bin/clipmenu"
    install -D -m755 \
        "${srcdir?}/$pkgname-$pkgver/clipmenud" \
        "${pkgdir?}/usr/bin/clipmenud"
}
