# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-user-avatar
pkgver=3.1.8
pkgrel=1
pkgdesc="Change user profile picture"
arch=('any')
url="https://wordpress.org/plugins/wp-user-avatar"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-user-avatar.${pkgver}.zip")
sha512sums=('c7f0a2d6b625dfe96cfca7973e67100a8c630bbb2a4355c7bf9704c3fa045d986d4fb1c47dee990c710019e0816c0263044e90833976bda0415a8ecdfc8ebffb')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-user-avatar" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
