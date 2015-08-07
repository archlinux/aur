# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipmenu
pkgver=1.0.0
pkgrel=3
pkgdesc='Clipboard management using dmenu'
url='http://github.com/cdown/clipmenu'
arch=('any')
license=('ISC')
depends=(dmenu xsel)
conflicts=(clipmenu-git)  # Old package from pre-AUR4 days

source=("https://github.com/cdown/clipmenu/archive/${pkgver}.zip")
md5sums=('0f5e418b538922fb5a55bb49df3ad763')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/clipmenu" \
        "$pkgdir/usr/bin/clipmenu"
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/clipmenud" \
        "$pkgdir/usr/bin/clipmenud"
}
