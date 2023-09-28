# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: JunYoung Gwak <aur@jgwak.com>

pkgname=ttf-kopub
pkgver=202204
pkgrel=1
pkgdesc="KoPub TrueType Korean fonts."
arch=('any')
license=('custom')
url="https://www.kopus.org/biz-electronic-font2-2/"
source=('https://www.kopus.org/wp-content/uploads/2022/04/KOPUB2.0_TTF_FONTS.zip'
        'LICENSE.pdf::https://www.kopus.org/wp-content/uploads/2021/04/%EC%84%9C%EC%B2%B4_%EB%9D%BC%EC%9D%B4%EC%84%A0%EC%8A%A4.pdf')

sha512sums=('501dfe9c6adc7590f804a19f7b83a6cdaeba6bf7bf356cc84bcccd0e63539635149c8fb348774770aa0388aa18d396ca78c35f16de147c54dc6ded6b9dea9f35'
            'd8b50eb3f9d44d527ce7afcbbe774d785d78ab60c803a11878942565f23133bb0fb9055200bbc03d8427e006d7dee63df443b03761e674c1b1c40d7af187c956')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 LICENSE.pdf $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
