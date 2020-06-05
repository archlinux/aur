# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-theme-geist
pkgver=1.1.4
pkgrel=1
pkgdesc="Personal blogging theme for WordPress. Port of Casper 2.0 theme for Ghost"
arch=('any')
url="https://chrisyee.ca/geist/"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/christophery/geist/archive/${pkgver}.tar.gz")
sha512sums=('760c1c1add2c6523cbc59fee7f442981c7ebbd04da0116cf43b867e0ec2fbf2a7bc347d61b5d22a301e0e04eec9f0ff489d8263710a7f093af72ebc3c51b0b46')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/themes"
  cp -ra "${srcdir}/geist-${pkgver}" "${pkgdir}/usr/share/webapps/wordpress/wp-content/themes/geist"
  install -D "${srcdir}/geist-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
