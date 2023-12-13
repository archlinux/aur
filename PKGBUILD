# Maintainer: Soma Yamamoto <mail[at]daizu[dot]dev>

pkgname=ttf-0xproto
pkgver=1.500
pkgrel=1
pkgdesc="An opinionated font for software engineers"
arch=(any)
url="https://github.com/0xType/0xProto"
license=(custom:SIL)
source=("$url/releases/download/$pkgver/0xProto_${pkgver/./_}.zip"
        "https://raw.githubusercontent.com/0xType/0xProto/$pkgver/LICENSE")
sha256sums=('ef780179f8cc3a893a7fbc92c76c78c1e149d20b4cb7e4b69ca260a33a430737'
            'a50b1f0b2acde640ade863d1d59aff6c50365ad4ec583e7cd3f6b268cb7bc128')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 fonts/0xProto-*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
