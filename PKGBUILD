# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-0xproto
pkgver=2.502
pkgrel=4
pkgdesc="An opinionated font for software engineers"
arch=(any)
url="https://github.com/0xType/0xProto"
license=(custom:SIL)
source=("$url/releases/download/$pkgver/0xProto_${pkgver/./_}.zip"
        "https://raw.githubusercontent.com/0xType/0xProto/$pkgver/LICENSE")
sha256sums=('402d046b6056111ae5b974892fe2d6d921c66a64681980ec81db051de05851e7'
            '8841e59e78081f4cb6ec51ad5bc698751b85ae14ee24f0f16bc9f9de07e4b90e')

package() {
    install -d $pkgdir/usr/share/fonts/TTF/{0xProto,0xProto-NL,ZxProto}
    install -m644 ./fonts/0xProto-{Bold,Italic,Regular}.ttf $pkgdir/usr/share/fonts/TTF/0xProto
    install -m644 ./fonts/No-Ligatures/0xProto-{Bold,Italic,Regular}-NL.ttf $pkgdir/usr/share/fonts/TTF/0xProto-NL
    install -m644 ./fonts/ZxProto/ZxProto-{Bold,Italic,Regular}.ttf $pkgdir/usr/share/fonts/TTF/ZxProto
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
