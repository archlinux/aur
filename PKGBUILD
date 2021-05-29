# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-user-avatar
pkgver=3.1.3
pkgrel=1
pkgdesc="Change user profile picture"
arch=('any')
url="https://wordpress.org/plugins/wp-user-avatar"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-user-avatar.${pkgver}.zip")
sha512sums=('269f2d08cef790a5043fab8c06e78bbd5b97d8268768456daa0185002cacd29a140a6f9d8c6d045cbcb2319678fc7cb18a39f3fb5e44e3ab8b5c0105827259e3')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-user-avatar" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
