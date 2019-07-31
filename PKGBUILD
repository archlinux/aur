# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-statistics
pkgver=12.6.7
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://github.com/wp-statistics/wp-statistics"
license=('GPL3')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-statistics.${pkgver}.zip")
sha512sums=("436d188ee1fdcada584a89c85858ae37311568b52c77b0c8936d786df8984ffc0beaf70dff8a27624b050ef29c5e0c80c8bf837ddefcb72cf578a463aaf02569")

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-statistics" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/wp-statistics/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
