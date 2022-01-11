# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: JunYoung Gwak <aur@jgwak.com>

pkgname=ttf-kopubworld
pkgver=1.0
pkgrel=4
pkgdesc="KoPub TrueType multilingual fonts."
arch=('any')
license=('custom')
url="https://www.kopus.org/biz-electronic-font2/"
source=('https://www.kopus.org/wp-content/uploads/2021/03/KOPUBWORLD_TTF_FONTS-1.zip'
        'LICENSE.pdf::https://www.kopus.org/wp-content/uploads/2021/04/%EC%84%9C%EC%B2%B4_%EB%9D%BC%EC%9D%B4%EC%84%A0%EC%8A%A4.pdf')

sha512sums=('4601f624c6d22d54c06d2d41ac4a825e9aa0f1698347b35c4d9c9794d6ab7ffdddb312f1ddfcdfdf6706cbf826550f04110f9375cebe1146039ea64ae3bbef1c'
            'd8b50eb3f9d44d527ce7afcbbe774d785d78ab60c803a11878942565f23133bb0fb9055200bbc03d8427e006d7dee63df443b03761e674c1b1c40d7af187c956')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/TTF
  install -m 644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 LICENSE.pdf $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
