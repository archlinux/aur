# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-disable-xml-rpc
pkgver=1.0.1
pkgrel=1
pkgdesc="Disable XML-RPC API on a Wordpress site"
arch=('any')
url="https://wordpress.org/plugins/disable-xml-rpc/"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/disable-xml-rpc.${pkgver}.zip")
sha512sums=('0d5d3217409bc12a01aea434b0a1821e6ad75358783e67ac9f617517e1098a951601b72f4730e7db0027b05e4c8bc06298c0785ef3ad54f0328af3172015bdf1')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/disable-xml-rpc" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
