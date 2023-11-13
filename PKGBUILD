# Maintainer: Soma Yamamoto <mail[at]daizu[dot]dev>

pkgname=ttf-0xproto
pkgver=1.402
pkgrel=1
pkgdesc="An opinionated font for software engineers"
arch=(any)
url="https://github.com/0xType/0xProto"
license=(custom:SIL)
source=("$url/releases/download/$pkgver/0xProto-Regular.ttf"
        "https://raw.githubusercontent.com/0xType/0xProto/$pkgver/LICENSE")
sha256sums=('43f899c59f323d604fb510e9a5a87ee7fc2c15c49ecc6394507ed16997607449'
            'a50b1f0b2acde640ade863d1d59aff6c50365ad4ec583e7cd3f6b268cb7bc128')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 0xProto-*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
