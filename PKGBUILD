# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=mpdmenu
pkgver=1.0.4
pkgrel=1
pkgdesc='dmenu frontend to MPD'
url='http://github.com/cdown/mpdmenu'
arch=('any')
license=('ISC')
depends=(dmenu)

source=("https://github.com/cdown/mpdmenu/archive/${pkgver}.zip")
md5sums=('4d25d98825928a3b860a36efba31f7dc')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/mpdmenu" \
        "$pkgdir/usr/bin/mpdmenu"
}
