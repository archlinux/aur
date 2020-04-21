# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-statistics
pkgver=12.6.13
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://github.com/wp-statistics/wp-statistics"
license=('GPL3')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-statistics.${pkgver}.zip")
sha512sums=('6059cb04b7fbd106f89727add5de6bbde663d9346136c4438ebd74194559e85ff70024316c2e800beba41bf0e699270cbd78a86d005aa22423c6a78fd1200de5')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-statistics" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/wp-statistics/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
