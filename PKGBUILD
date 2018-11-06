# Maintainer: Ivan Koryabkin <apathism@apathism.net>

pkgname=otf-permian
pkgver=1.000
pkgrel=1
pkgdesc='Permian cyrillic font made for the city of Perm'
arch=('any')
license=('custom')
url="http://permian.design.ru/"
depends=('fontconfig' 'xorg-font-utils')
source=("${url}/permian.zip")
sha256sums=('64f86350b8d72f33bedd7508dea9e2cf735dbcaf630cbb9328dd230f9c71aa5b')

package() {
  cd "${srcdir}/permian"

  install -d "${pkgdir}/usr/share/fonts/OTF/"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF/"
  install -Dm644 "permian-license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
