# Maintainer: 0x2501 <0x2501 AT sol740 DOT net>
pkgname=(otf-dinish ttf-dinish)
pkgbase=dinish-font
pkgver=4.007
pkgrel=2
pkgdesc='DINish is a font inspired by the lettering of the German Autobahn road signs.'
arch=(any)
url="https://github.com/playbeing/dinish"
license=('OFL-1.1-no-RFN')
source=("$url/releases/download/v$pkgver/dinish-otf.zip"
        "$url/releases/download/v$pkgver/dinish-ttf.zip"
        "$url/blob/main/OFL.txt")
b2sums=('76851afec0cc8de06df8c25a0b9d6433ae38ca551c5b24b374c7a8a7c3d4554d619a8659c7852437ebefbf6bed2e620873a383d0b8ac5eabd3beb753442545fa'
        '8073b37465876c7588b00c6496de8692d3906c32e605bf542008ee9c077f5ea5fb349e2908b77ddf231e6b975c320ce25d605ccdc08f4e9160219cf18f5d7045'
        '18d0f5300b0a9daf89d47c75814f7ae553818f14e65ab4709db6e440134dddae738ef12908b5b5441514b2dc6ae3a9810fd1657d157023de2dcbe8772f805bf5')

package_otf-dinish() {
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/dinish" *.otf
}

package_ttf-dinish() {
  cd "$srcdir"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
  install -Dm644 -t "$pkgdir/usr/share/fonts/dinish" *.ttf
}
