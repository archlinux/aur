# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=mpdmenu
pkgver=1.0.5
pkgrel=1
pkgdesc='dmenu frontend to MPD'
url='http://github.com/cdown/mpdmenu'
arch=('any')
license=('ISC')
depends=(dmenu)

source=("https://github.com/cdown/mpdmenu/archive/${pkgver}.zip")
md5sums=('94128ef59659f6e5aa39081b28b84e0d')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/mpdmenu" \
        "$pkgdir/usr/bin/mpdmenu"
}
