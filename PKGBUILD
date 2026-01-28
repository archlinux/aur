# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-0xproto
pkgver=2.502
pkgrel=1
pkgdesc="An opinionated font for software engineers"
arch=(any)
url="https://github.com/0xType/0xProto"
license=(custom:SIL)
source=("$url/releases/download/$pkgver/0xProto_${pkgver/./_}.zip"
        "https://raw.githubusercontent.com/0xType/0xProto/$pkgver/LICENSE")
sha256sums=('179654842a35734034963a9ac4437438d1b48bedb4e1201c13d2eb93d1973e9d'
            '8841e59e78081f4cb6ec51ad5bc698751b85ae14ee24f0f16bc9f9de07e4b90e')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 ./fonts/0xProto-{Bold,Italic,Regular}.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
