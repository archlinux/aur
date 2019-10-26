# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-antispam-bee
pkgver=2.9.1
pkgrel=1
pkgdesc="Anti spam plugin"
arch=('any')
url="https://github.com/pluginkollektiv/antispam-bee"
license=('GPL2')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/antispam-bee.${pkgver}.zip")
sha512sums=('1185178ba6a086a1c3a4a2b106606dd25fe4f1e1dc04eb0777cf42b0ab7ec39ec88ee34440904f651860a1b9ec74d4cb42209ceafc5737b98dcbb1316355bd43')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/antispam-bee" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
  install -D "${srcdir}/antispam-bee/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
