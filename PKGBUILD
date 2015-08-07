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
md5sums=('ec105f1c7b6852efe68fc1e3673716fa')

package() {
    install -D -m755 \
        "$srcdir/$pkgname-$pkgver/mpdmenu" \
        "$pkgdir/usr/bin/mpdmenu"
}
