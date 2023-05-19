# Maintainer: Pedro A. López-Valencia <https://aur.archlinux.org/user/toropisco>
pkgname=('ttf-literata' 'ttf-literata-opticals' 'ttf-literata-webfonts' 'ttf-literata-webfonts-opticals')
pkgbase=ttf-literata
pkgver=3.103
pkgrel=1
pkgdesc="Google's contemporary serif typeface family for long-form reading; default typeface for Play Books. Truetype, open source (OFL) distribution."
arch=('any')
url="https://github.com/googlefonts/literata"
license=('custom:OFL')
conflicts=('otf-literata')
replaces=('otf-literata')
source=("literata-$pkgver.zip::https://github.com/googlefonts/literata/releases/download/$pkgver/$pkgver.zip"
        "https://raw.githubusercontent.com/googlefonts/literata/main/OFL.txt")
b2sums=('d626f872310c6e857d0ba2d8751cbade216d3b232457bb16dc1268ea6529476b78ac71a12038bc6a775d2d474bc2d64559d65987250a3b384eb8566f60466cbe'
        '2a91a436d60192c0794f4114ef755a23f99a062b1485f96ee4196f862cd8c022079cbb2310d3406dc5059a01d6986663e7ecf2411a52d2d5425cbe07301bc2d6')

package_ttf-literata() {
pkgname='ttf-literata'
pkgdesc="Google's default typeface for Play Books. Truetype collections, open source (OFL) distribution."
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/share/fonts/TTF/literata"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  install -m644 fonts/variable/Literata*.ttf "$pkgdir/usr/share/fonts/TTF/literata"
  install -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-literata-opticals() {
pkgname='ttf-literata-opticals'
pkgdesc="Google's default typeface for Play Books. Truetype opticals, open source (OFL) distribution."
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/share/fonts/TTF/literata-opticals"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  install -m644 fonts/ttf/Literata*.ttf "$pkgdir/usr/share/fonts/TTF/literata-opticals"
  install -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-literata-webfonts() {
pkgname='ttf-literata-webfonts'
pkgdesc="Google's default typeface for Play Books. Truetype collection webfonts, open source (OFL) distribution."
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/share/literata-webfonts"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  install -m644 fonts/webfonts/Literata[opsz,wght].woff2 "$pkgdir/usr/share/literata-webfonts"
  install -m644 fonts/webfonts/Literata-Italic[opsz,wght].woff2 "$pkgdir/usr/share/literata-webfonts"
  install -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname"
}

package_ttf-literata-webfonts-opticals() {
pkgname='ttf-literata-webfonts-opticals'
pkgdesc="Google's default typeface for Play Books. Truetype webfonts opticals, open source (OFL) distribution."
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/share/literata-webfonts-opticals"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  install -m644 fonts/webfonts/Literata{,7pt,36pt,72pt}-*.woff2 "$pkgdir/usr/share/literata-webfonts-opticals"
  #rm "$pkgdir/usr/share/literata-webfonts-opticals/Literata[opsz,wght].woff2"
  rm "$pkgdir/usr/share/literata-webfonts-opticals/Literata-Italic[opsz,wght].woff2"
  install -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname"
}
