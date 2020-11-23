# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-user-avatar
pkgver=2.2.8
pkgrel=1
pkgdesc="Change user profile picture"
arch=('any')
url="https://wordpress.org/plugins/wp-user-avatar"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-user-avatar.${pkgver}.zip")
sha512sums=('d3b7e63e7c1365ca58a973eaf1e228b921eb2d18b2537e6dc848ad50fe0b07a38ed40993e99836016a1f9d2db962899865f3d28b52bff13548fa0d92b110b302')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-user-avatar" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
