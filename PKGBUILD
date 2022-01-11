# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: JunYoung Gwak <aur@jgwak.com>

pkgname=otf-kopub
pkgver=2.0
pkgrel=4
pkgdesc="KoPub OpenType Korean fonts."
arch=('any')
license=('custom')
url="https://www.kopus.org/biz-electronic-font2-2/"
source=('https://www.kopus.org/wp-content/uploads/2021/03/KOPUB2.0_OTF_FONTS.zip'
        'LICENSE::https://www.kopus.org/wp-content/uploads/2021/04/%EC%84%9C%EC%B2%B4_%EB%9D%BC%EC%9D%B4%EC%84%A0%EC%8A%A4.pdf')

sha512sums=('255eadd055273c8461f0afd774355390ec4c619ff000e4da5a4c75acbda76d4b23ab09300348ed86fef6911a83ab7ba3bd837203ee1d938ca260e519acebe098'
            'd8b50eb3f9d44d527ce7afcbbe774d785d78ab60c803a11878942565f23133bb0fb9055200bbc03d8427e006d7dee63df443b03761e674c1b1c40d7af187c956')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/OTF
  install -m 644 $srcdir/*.otf $pkgdir/usr/share/fonts/OTF
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf
}
