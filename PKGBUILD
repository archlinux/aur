# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-breeze
pkgver=1.2.4
pkgrel=1
pkgdesc="Cache plugin with extensive options to speed up your website"
arch=('any')
url="https://wordpress.org/plugins/breeze"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/breeze.${pkgver}.zip")
sha512sums=('a58934532a9ceb700592b4eb9488ff4da7390dad5fe65eb026f810416e8cadd3728d5aae5f5ce84474d57515ce3c291a1794edb1fcdbe0e982d804c6b4067a47')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/breeze" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
