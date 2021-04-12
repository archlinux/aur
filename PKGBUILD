# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-wp-user-avatar
pkgver=2.2.16
pkgrel=1
pkgdesc="Change user profile picture"
arch=('any')
url="https://wordpress.org/plugins/wp-user-avatar"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/wp-user-avatar.${pkgver}.zip")
sha512sums=('72adaf02a8e1456bc2660ed9128f8b8194d251e8a5c401b51987c7c0dd978833f3f0e057a9fa8b5930761ade20dd1602da77359e70c85d1d4af4466c6be6b478')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/wp-user-avatar" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
