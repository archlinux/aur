# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=mpdmenu
pkgver=1.0.3
pkgrel=2
pkgdesc='dmenu frontend to MPD'
url='http://github.com/cdown/mpdmenu'
arch=('any')
license=('ISC')
depends=(dmenu)

source=("https://github.com/cdown/mpdmenu/archive/v${pkgver}.zip")
md5sums=('ecb0e17c116e6c0ab1a33fd32c79cdd5')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/mpdmenu" \
        "$pkgdir/usr/bin/mpdmenu"
}
