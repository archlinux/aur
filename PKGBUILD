# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-breeze
pkgver=1.1.11
pkgrel=1
pkgdesc="Cache plugin with extensive options to speed up your website"
arch=('any')
url="https://wordpress.org/plugins/breeze"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/breeze.${pkgver}.zip")
sha512sums=('f1875f7cc4c417f41a8b0e3e0190f8d0fef19aec0e1def6ac78872394f6b33a443b45e3841d95591b23f6738b3bfb84ea0adc22ef698c7ce9908e3b5e97c1140')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/breeze" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
