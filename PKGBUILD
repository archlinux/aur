# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-user-avatar
pkgver=3.1.6
pkgrel=1
pkgdesc="Change user profile picture"
arch=('any')
url="https://wordpress.org/plugins/wp-user-avatar"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-user-avatar.${pkgver}.zip")
sha512sums=('2b454e54115b853eeb3109ebb69f0600ea686cbd197225661fb462ef313e3f5405a69a3fac5878c57fb5fc517344344f3fb6054b3078506c2df13290f6f5140a')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-user-avatar" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
