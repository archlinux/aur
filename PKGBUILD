# Maintainer: wuhang2003 <i@zwh.moe>

pkgname=ttf-sarasa-gothic-nerd-fonts
pkgver=1.0.28_0
pkgrel=1
pkgdesc="Nerd fonts patched Sarasa Gothic font. (TTC)"
arch=('any')
url="https://github.com/jonz94/Sarasa-Gothic-Nerd-Fonts"
license=('OFL')
provides=('ttf-sarasa-gothic-nerd-fonts')
source=(sarasa-nerd-font-ttc-${pkgver}-${pkgrel}.zip::"https://github.com/jonz94/ttc-sarasa-gothic-nerd-fonts/releases/download/v${pkgver//_/-}/sarasa-nerd-font-ttc.zip"
        "LICENSE-${pkgver//_/-}::https://raw.githubusercontent.com/jonz94/Sarasa-Gothic-Nerd-Fonts/v${pkgver//_/-}/LICENSE")
sha512sums=('88e91969d0e7ecd67cd9eef8af765cca28d91e1e785bad89115f22b362a034f272be73a4a7bff24eaeefa56506a9947c28599b2b668ae87179a7880065199a84'
            '81709acc66bb7c2de2635c9b6e043f35126228d1f2a8dc6acd93245061177e136be08a7f7aa314731bc95c5fb8c9841b78d9129810650f9a9f590753ae1c8484')

package() {
    install -d "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -m644 *.ttc "$pkgdir/usr/share/fonts/${pkgname:4}"
    install -Dm644 "LICENSE-${pkgver//_/-}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
