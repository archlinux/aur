# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-statistics
pkgver=13.0.5
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://github.com/wp-statistics/wp-statistics"
license=('GPL3')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-statistics.${pkgver}.zip")
sha512sums=('9aa6a36c0a726bb9f708616994b7f9fc289e4d3ff156025b1613ac5f263fcd3d4186e2b97b28915ad6413718e1329767afda6695ab2e7cc2b64b88d96baa0c04')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-statistics" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/wp-statistics/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
