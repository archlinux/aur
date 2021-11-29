# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=otf-ibarra-real
pkgver=2.1
pkgrel=4
pkgdesc='Serif font used for 1780 edition of El Quijote'
arch=('any')
url='http://www.ibarrareal.es/'
license=('custom:as-is')
source=('http://www.ibarrareal.es/font/ibarrareal.zip'
        'LICENSE')
b2sums=('d19a2deff9cd84c9f479837f8c9f7f834ec8efe13774f5f79ef45613945d443545e01fb014071c364ea4d319d0dcc566bdc876bf0fb767a1d00ab17e50b0a8e7'
        '3673224067c383a52552b40e99df5f1c94538aa36d814dcb1a3e5eee844edb1a0b60343ce087b9c6eda840d5c3f955c378f86d818bb180cf05c818a61223bd1d')

package() {
  install -dm755 ${pkgdir}/usr/share/fonts/OTF/
  install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
