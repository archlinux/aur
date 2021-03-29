# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-antispam-bee
pkgver=2.9.4
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://github.com/pluginkollektiv/antispam-bee"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/antispam-bee.${pkgver}.zip")
sha512sums=('3686a742c56a965d438e1da04ea858e7ad0f858559dd5ef81d5f1c7fabcf8877caff3821134a3c2c95649e9682e48a3543dd5c703fd0a8f6afba571d089824a4')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/antispam-bee" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/antispam-bee/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
