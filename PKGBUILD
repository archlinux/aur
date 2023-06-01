# Maintainer: Soma Yamamoto <soya_daizu[at]proton[dot]me>

pkgname=ttf-0xproto
pkgver=1.001
pkgrel=1
pkgdesc="An opinionated font for software engineers"
arch=(any)
url="https://github.com/0xType/0xProto"
license=(custom:SIL)
source=("$url/releases/download/$pkgver/0xProto-Regular.ttf"
        "https://raw.githubusercontent.com/0xType/0xProto/$pkgver/LICENSE")
sha256sums=("583c3d37dde244f5f80bef49fa3b0c5b2ec0f7f81b522b0ded1f27620d18e40d"
            "a50b1f0b2acde640ade863d1d59aff6c50365ad4ec583e7cd3f6b268cb7bc128")

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 0xProto-*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
