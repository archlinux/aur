# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-breeze
pkgver=1.2.1
pkgrel=1
pkgdesc="Cache plugin with extensive options to speed up your website"
arch=('any')
url="https://wordpress.org/plugins/breeze"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/breeze.${pkgver}.zip")
sha512sums=('d73a0da483227b840e2bde3a10c9ef4704cf645cbc68d0d03f48deadda696533623926250d53ab9e441fcece0f5e3cff6f81e464a14a5d559a8bfb5d48a5c53a')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/breeze" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
