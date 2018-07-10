# Maintainer: JunYoung Gwak <i@jgwak.com>

pkgname=otf-kopub
pkgver=1.0
pkgrel=1
pkgdesc="KoPub OpenType Korean fonts."
arch=('any')
license=('custom')
url="http://www.kopus.org/biz/electronic/font.aspx"
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.kopus.org/Download_font.aspx?font_id=4&name=KOPUB_OTF_FONTS.zip'
        'LICENSE::http://www.kopus.org/Download/kopub%EC%A0%84%EC%9E%90%EC%B1%85%EA%B8%80%EA%BC%B4_%EB%9D%BC%EC%9D%B4%EC%84%A0%EC%8A%A4.hwp')
md5sums=('210c54010012db40ec72ec94f830d823'
         '0c84c149ac7bab45bcbc08f9ad92ca0b')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/OTF
  install -m 644 $srcdir/*.otf $pkgdir/usr/share/fonts/OTF
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.hwp
}
