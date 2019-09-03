# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-jetpack
pkgver=7.7
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://wordpress.org/plugins/jetpack"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/jetpack.${pkgver}.zip")
sha512sums=('4d9298e4e585b82ef185af8ad55946a8a809854e53b976b919d6efac37074fd9d5d50a30c7e9cddfc21eddab09a7e05a27907f8758931e0eeeba0ca69b4f2e1e')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/jetpack" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
