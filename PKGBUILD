# Maintainer: wuhang2003 <i@zwh.moe>

pkgname=ttf-sarasa-gothic-nerd-fonts
pkgver=0.41.10_0
pkgrel=1
pkgdesc="Nerd fonts patched Sarasa Gothic font. (TTC)"
arch=('any')
url="https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts"
license=('OFL')
provides=('ttf-sarasa-gothic-nerd-fonts')
source=("https://github.com/jonz94/ttc-sarasa-gothic-nerd-fonts/releases/download/v${pkgver//_/-}/sarasa-nerd-font-ttc.zip"
        "LICENSE-${pkgver//_/-}::https://raw.githubusercontent.com/jonz94/Sarasa-Gothic-Nerd-Fonts/v${pkgver//_/-}/LICENSE")
sha512sums=('66137af3d5b88c98e7e1ab41a5c7cbdac4169681dfd92869e6e13fc1dc355d94e21703e318a84e16710c2cf11b02f6d151ac6adf2944089b251fae136883578f'
            '81709acc66bb7c2de2635c9b6e043f35126228d1f2a8dc6acd93245061177e136be08a7f7aa314731bc95c5fb8c9841b78d9129810650f9a9f590753ae1c8484')

package() {
    install -d "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -m644 *.ttc "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -Dm644 "LICENSE-${pkgver//_/-}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
