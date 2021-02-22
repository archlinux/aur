pkgname=ttf-blogger-sans
pkgver=1.1
pkgrel=2
pkgdesc="Blogger Sans font from https://firstsiteguide.com/"
arch=(any)
depends=()
source=(
  "${pkgname}-${pkgver}.zip::https://firstsiteguide.com/wp-content/uploads/2015/09/BloggerSansWebFontsConvertedFromOTF.zip"
  'https://creativecommons.org/licenses/by/4.0/legalcode.txt'
)
sha512sums=(
  '89af98616c2eb74bce23b644d8e70f6785494af2a16d317fa3b84dec05296a02c1e33be8bad598fafa2dcd5be02889972663366ba9a14321d1e3c1957659ee2f'
  '520e5d53a5aed9c95e8d69ab1d9ef5e91492b141d07f0699dd77d91c292fa12b3fdd05aa01d7567a18e5f6bca28a888f78b117405454b2f24a3bb5ff77384768'
)
license=('custom:CC BY 4.0')

package() {
	install -d "${pkgdir}/usr/share/fonts/TTF"
	install -m644 Blogger\ Sans/*.ttf "$pkgdir/usr/share/fonts/TTF/"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 legalcode.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
