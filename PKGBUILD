# Maintainer: Kyle Keen < keenerd at gmail >

pkgname=ttf-lobsang-monlam
pkgver=1
pkgrel=2
pkgdesc='A Tibetan font, Monlam Bod-Yig'
arch=('any')
license=('Apache')
#url='http://lobsangmonlam.org/'
url='http://digitaltibetan.org/index.php/Tibetan_Fonts'
depends=()
source=("http://monlam-dictionary.googlecode.com/files/monlambodyig.ttf")
md5sums=('e5da214e2c392d00f29af696c813b63e')
source=("https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniChouk.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniChoukmatik.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniDutsa1.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniDutsa2.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniOuchan1.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniOuchan2.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniOuchan3.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniOuchan4.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniOuchan5.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniPaytsik.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniSansSerif.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniTikrang.ttf"
        "https://archive.org/download/bodyig/fonts/Monlam3%20Fonts/MonlamUniTiktong.ttf")
md5sums=('8f052e98c625cb1aa8eaa5cb7603e75b'
         '6b86299aa01da659ce8ee16d85f3360a'
         '5239cc54845df6d8ce421aeeccdec1d8'
         'd5e23e97295644528163d5d04ae035af'
         '91022cb5c714e269d2a49759ea20e160'
         '8ddc5bc475b1226b059c5b49217baadd'
         '749888a3ae86359678c22dff0925a7d9'
         '2a5623ca87f9771aab112597fd1007e3'
         '4a915b15db8c534b00a74313af22aef0'
         'de2d28b4411a6e80c75b3746beb1f667'
         '53db2ba9110683aceefb908b50e7c36c'
         '330664cefe081b661850017d7647a41d'
         'c520cab43080c2fa6cd6c6c1d874f542')

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}

