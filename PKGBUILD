# Maintainer: Sosuke Inaba <mail[at]daizu[dot]dev>

pkgname=ttf-bizin-gothic
pkgver=0.0.4
pkgrel=2
pkgdesc="A composite font of BIZ UD Gothic and Inconsolata"
arch=(any)
url="https://github.com/yuru7/bizin-gothic"
license=('OFL-1.1')
source=("$url/releases/download/v$pkgver/BizinGothic_v$pkgver.zip"
        "$url/releases/download/v$pkgver/BizinGothicDiscord_v$pkgver.zip"
        "$url/releases/download/v$pkgver/BizinGothicNF_v$pkgver.zip"
        "https://raw.githubusercontent.com/yuru7/bizin-gothic/v$pkgver/LICENSE")
sha256sums=('e9d01c6ba56161c8a68e2998b71508110e2d70742512f6dafde1a569b0fbf877'
            '54e02ce9fe90073da7b07f59cbee87dac097271bec85c28bfd61283653849c66'
            '027982bfbd535d411f03f7bf603545493516eb51a98b49616053e926b9211215'
            '84d463be283b64d6da4645194b5a2ea57f3a99b135574cce76eea0b9e3bffada')

package() {
    install -d $pkgdir/usr/share/fonts/TTF
    install -m644 BizinGothic_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 BizinGothicDiscord_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -m644 BizinGothicNF_v$pkgver/*.ttf $pkgdir/usr/share/fonts/TTF
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
