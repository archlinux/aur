# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: JunYoung Gwak <aur@jgwak.com>

pkgname=otf-kopubworld
pkgver=1.0
pkgrel=4
pkgdesc="KoPub OpenType multilingual fonts."
arch=('any')
license=('custom')
url="https://www.kopus.org/biz-electronic-font2/"
source=('https://www.kopus.org/wp-content/uploads/2021/03/KOPUBWORLD_OTF_FONTS.zip'
        'LICENSE.pdf::https://www.kopus.org/wp-content/uploads/2021/04/%EC%84%9C%EC%B2%B4_%EB%9D%BC%EC%9D%B4%EC%84%A0%EC%8A%A4.pdf')

sha512sums=('52ee929aeb3de45663d758df0d0e72186c10a16f5fa94b9e050534435937872e849ac51cd8206e8ba71ecfa16d2d5f791a2e2a02527c579ba90056813f6cbb52'
            'd8b50eb3f9d44d527ce7afcbbe774d785d78ab60c803a11878942565f23133bb0fb9055200bbc03d8427e006d7dee63df443b03761e674c1b1c40d7af187c956')

package() {
  install -dm 755 $pkgdir/usr/share/fonts/OTF
  install -m 644 $srcdir/*.otf $pkgdir/usr/share/fonts/OTF
  install -Dm 644 LICENSE.pdf $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
