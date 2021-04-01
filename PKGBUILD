# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-co-authors-plus
pkgver=3.4.5
pkgrel=1
pkgdesc="Assign multiple bylines to posts, pages, and custom post types"
arch=('any')
url="https://wordpress.org/plugins/co-authors-plus"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/co-authors-plus.zip")
sha512sums=('ce550499254ccc1c1f39f7e57663be4beb3cbe9262d65423fc0294401fa928b9cffc3103572847fd60dc061c3fcdfb19f1672753f38fe092f18b2dec8230ebd9')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/co-authors-plus" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
