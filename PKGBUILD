# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/toropisco>
pkgname=('ttf-literata' 'ttf-literata-opticals')
pkgbase=ttf-literata
pkgver=3.002
pkgrel=4
pkgdesc="Google's contemporary serif typeface family for long-form reading; default typeface for Play Books. Truetype, open source (OFL) distribution."
arch=('any')
url="https://github.com/googlefonts/literata"
license=('custom:OFL')
conflicts=('otf-literata')
replaces=('otf-literata')
source=("https://github.com/googlefonts/literata/releases/download/$pkgver/Literata-v$pkgver.zip"
        "https://raw.githubusercontent.com/googlefonts/literata/main/OFL.txt")
b2sums=('369759afd37f4503d9bc07eb592e963879e5dda8772c07b457f2d9308c1ae1a4411a8ed6263d358211efd49d6206004da881c9253e79d714b7aaad96520b7070'
        '2a91a436d60192c0794f4114ef755a23f99a062b1485f96ee4196f862cd8c022079cbb2310d3406dc5059a01d6986663e7ecf2411a52d2d5425cbe07301bc2d6')

package_ttf-literata() {
pkgname='ttf-literata'
pkgdesc="Google's default typeface for Play Books. Truetype Collections, open source (OFL) distribution."
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  install -m644 variable/Literata*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-literata-opticals() {
pkgname='ttf-literata-opticals'
pkgdesc="Google's default typeface for Play Books. Truetype opticals, open source (OFL) distribution."
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  install -m644 static/ttf/Literata*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname"
}
