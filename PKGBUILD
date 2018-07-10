# Maintainer: JunYoung Gwak <i@jgwak.com>

pkgname=ttf-kopub
pkgver=1.0
pkgrel=1
pkgdesc="KoPub TrueType Korean fonts."
arch=('any')
license=('custom')
url="http://www.kopus.org/biz/electronic/font.aspx"
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.kopus.org/Download_font.aspx?font_id=3&name=KOPUB_TTF_FONTS.zip'
        'LICENSE::http://www.kopus.org/Download/kopub%EC%A0%84%EC%9E%90%EC%B1%85%EA%B8%80%EA%BC%B4_%EB%9D%BC%EC%9D%B4%EC%84%A0%EC%8A%A4.hwp')
md5sums=('170f4f9e87a187b2943b245486aa8bfe'
         '0c84c149ac7bab45bcbc08f9ad92ca0b')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.hwp
}
