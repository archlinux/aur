# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-serif-classic-fonts
pkgver=1.001
pkgrel=7
pkgdesc='Adobe Source Han Serif fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-serif-classic"
license=('custom:OFL')
source=($pkgver-$pkgrel.zip::"https://github.com/redchenjs/source-han-serif-classic/releases/download/$pkgver/SourceHanSerifC-OTF.zip")
sha512sums=('3240ae2db77db4a79213db3d0d25aec7acfe755e79400384594b7f74711c4e9abd22c03dec9faba7b6d045f1f3b50563e0b4bcc01879338b82b0a8828fc78c14')

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-serif"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-serif/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
