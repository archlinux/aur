# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-theme-geist
pkgver=1.1.3
pkgrel=1
pkgdesc="Personal blogging theme for WordPress. Port of Casper 2.0 theme for Ghost"
arch=('any')
url="https://chrisyee.ca/geist/"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/christophery/geist/archive/${pkgver}.tar.gz")
sha512sums=('8cb27d7364c358bdeb31a2d1051c5e19315038b7fb6635d1a5427e0f4ce6bd2bf2b0bb55e613a6b33d86401360d3c5d3df38d9618fb3f3121737a721e45935e0')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/themes"
  cp -ra "${srcdir}/geist-${pkgver}" "${pkgdir}/usr/share/webapps/wordpress/wp-content/themes/geist"
  install -D "${srcdir}/geist-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
