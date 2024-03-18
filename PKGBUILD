# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-0xproto
pkgver=1.603
pkgrel=1
pkgdesc="An opinionated font for software engineers"
arch=(any)
url="https://github.com/0xType/0xProto"
license=(custom:SIL)
source=("$url/releases/download/$pkgver/0xProto_${pkgver/./_}.zip"
        "https://raw.githubusercontent.com/0xType/0xProto/$pkgver/LICENSE")
sha256sums=('100c3478d17f0bed536173944b81a72d989195dd7a3cb84f7d6bacc429bad211'
            'a50b1f0b2acde640ade863d1d59aff6c50365ad4ec583e7cd3f6b268cb7bc128')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 fonts/0xProto-*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
