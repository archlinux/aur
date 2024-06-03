# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-bizin-gothic
pkgver=0.0.2
pkgrel=1
pkgdesc="A composite font of BIZ UD Gothic and Inconsolata"
arch=(any)
url="https://github.com/yuru7/bizin-gothic"
license=(custom:SIL)
source=("$url/releases/download/v$pkgver/BizinGothic_v$pkgver.zip"
        "$url/releases/download/v$pkgver/BizinGothicDiscord_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/bizin-gothic/v$pkgver/LICENSE")
sha256sums=('66906c95284c105d2b3f71aeee07333e6045c0eb430425aad74148ec31995e2a'
            'c47eaf24d16049499e152e369b0cf7d183c2ffd98c4c0430cbf55df56b1cb3ca'
            '84d463be283b64d6da4645194b5a2ea57f3a99b135574cce76eea0b9e3bffada')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 BizinGothic_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 BizinGothicDiscord_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
