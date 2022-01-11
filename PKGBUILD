# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: JunYoung Gwak <aur@jgwak.com>

pkgname=ttf-kopub
pkgver=2.0
pkgrel=4
pkgdesc="KoPub TrueType Korean fonts."
arch=('any')
license=('custom')
url="https://www.kopus.org/biz-electronic-font2-2/"
source=(
  'https://www.kopus.org/wp-content/uploads/2021/03/KOPUB2.0_TTF_FONTS.zip'
  'LICENSE::https://www.kopus.org/wp-content/uploads/2021/04/%EC%84%9C%EC%B2%B4_%EB%9D%BC%EC%9D%B4%EC%84%A0%EC%8A%A4.pdf'
)

sha512sums=(
  'ed4a4cebc6f9ad0752b8e382836f2babfa1445ae789da16ed27a1098f07cfc74a5ca41c617eea1d19923136457cc5e3b20a904182fc8f9ea6a38e3f88ae5a08a'
  'd8b50eb3f9d44d527ce7afcbbe774d785d78ab60c803a11878942565f23133bb0fb9055200bbc03d8427e006d7dee63df443b03761e674c1b1c40d7af187c956'
)

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf
}
