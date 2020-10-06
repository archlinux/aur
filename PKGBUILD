# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-jetpack
pkgver=9.0
pkgrel=1
pkgdesc="Traffic analysis, security and performance enhancements for Wordpress"
arch=('any')
url="https://wordpress.org/plugins/jetpack"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/jetpack.${pkgver}.zip")
sha512sums=('1d8830b8dc5a5e184bf347c4801254d13270e7ab02d2b7f229f2b811a791cfae7af5e85da9a306591e301d70328bfc41e89d45c4b8c52a75ba64b29f5f6bfef7')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/jetpack" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
