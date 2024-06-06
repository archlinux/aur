# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-0xproto
pkgver=2.100
pkgrel=1
pkgdesc="An opinionated font for software engineers"
arch=(any)
url="https://github.com/0xType/0xProto"
license=(custom:SIL)
source=("$url/releases/download/$pkgver/0xProto_${pkgver/./_}.zip"
        "https://raw.githubusercontent.com/0xType/0xProto/$pkgver/LICENSE")
sha256sums=('3c6fb670f65fde3d5f91301955680c282710d91f55580462152528f3e92849e8'
            'ab565cf6f06e87f36c0f31c2dfaf3dec25fb194adf043f41cf4781a031338a3e')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 0xProto-*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
