# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-co-authors-plus
pkgver=3.4.2
pkgrel=1
pkgdesc="Assign multiple bylines to posts, pages, and custom post types"
arch=('any')
url="https://wordpress.org/plugins/co-authors-plus"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/co-authors-plus.${pkgver}.zip")
sha512sums=('cebc31882d5f76fa8e5eedd71c228fe86055470d9db8f0d38844ff66f4c878feb16c912db8195c5e2a09cf4c48760e90ad3d9054eeec31f9093d81f145f6357c')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/co-authors-plus" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
