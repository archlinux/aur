# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-breeze
pkgver=1.2.5
pkgrel=1
pkgdesc="Cache plugin with extensive options to speed up your website"
arch=('any')
url="https://wordpress.org/plugins/breeze"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/breeze.${pkgver}.zip")
sha512sums=('815ff47b2d0d559bad155ccb5147525c79e027369a9a96dbd907443557c617b4f7c023235ae5cdcf4bda34a607e07018beb3a2e1f57e4036ffadd5f846083ef2')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/breeze" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
