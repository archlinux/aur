# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-co-authors-plus
pkgver=3.4.3
pkgrel=1
pkgdesc="Assign multiple bylines to posts, pages, and custom post types"
arch=('any')
url="https://wordpress.org/plugins/co-authors-plus"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/co-authors-plus.zip")
sha512sums=('0fde964d07ab4d53d2ea7edcd3496c04536767b49e1ce205db3cfaa56dab2183f7c7faf4dd7fa71b3afc7b4d153a5359b52523dc34f6f9bccb6c81327baaeded')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/co-authors-plus" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
