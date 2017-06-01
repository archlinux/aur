# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=mpdmenu
pkgver=1.0.3
pkgrel=3
pkgdesc='dmenu frontend to MPD'
url='http://github.com/cdown/mpdmenu'
arch=('any')
license=('ISC')
depends=(dmenu)

source=("https://github.com/cdown/mpdmenu/archive/v${pkgver}.zip")
md5sums=('f5786f768b4b5c4a6e9ea08697e8b256')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/mpdmenu" \
        "$pkgdir/usr/bin/mpdmenu"
}
