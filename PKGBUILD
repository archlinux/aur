# Maintainer: Soma Yamamoto <mail[at]daizu[dot]dev>

pkgname=ttf-0xproto
pkgver=1.300
pkgrel=1
pkgdesc="An opinionated font for software engineers"
arch=(any)
url="https://github.com/0xType/0xProto"
license=(custom:SIL)
source=("$url/releases/download/$pkgver/0xProto-Regular.ttf"
        "https://raw.githubusercontent.com/0xType/0xProto/$pkgver/LICENSE")
sha256sums=('fdde45b969c25575af0159f405fe3f1f55208513a65ebcb0e3c07fb863059990'
            'a50b1f0b2acde640ade863d1d59aff6c50365ad4ec583e7cd3f6b268cb7bc128')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 0xProto-*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
