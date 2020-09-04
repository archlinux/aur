# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-theme-geist
pkgver=1.1.5
pkgrel=1
pkgdesc="Personal blogging theme for WordPress. Port of Casper 2.0 theme for Ghost"
arch=('any')
url="https://chrisyee.ca/geist/"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/christophery/geist/archive/${pkgver}.tar.gz")
sha512sums=('c00cadf6f6cff3833929d020acd0aa99dccb642332eaaad9aaac53cc0c5331be3172aa4b184d7efad6547f290f3292b62629db89afe062f9c5bf25fde17b09e3')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/themes"
  cp -ra "${srcdir}/geist-${pkgver}" "${pkgdir}/usr/share/webapps/wordpress/wp-content/themes/geist"
  install -D "${srcdir}/geist-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
