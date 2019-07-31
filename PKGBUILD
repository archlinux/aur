# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-gdpr
pkgver=2.1.1
pkgrel=1
pkgdesc="Making your website ready for the GDPR"
arch=('any')
url="https://github.com/WP-GDPR/wp-gdpr-core"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-gdpr-core.${pkgver}.zip")
sha512sums=("6920228f9cf2513a52cd762c0d03ad1f6f663963acacbfddd691c9b53be1b4e8a24cf8440774dfda89782d8765490d3c9b08d8b8ca5dfbb9730b278a6ddcabe4")

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-gdpr-core" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
