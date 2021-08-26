# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-co-authors-plus
pkgver=3.4.91
pkgrel=1
pkgdesc="Assign multiple bylines to posts, pages, and custom post types"
arch=('any')
url="https://wordpress.org/plugins/co-authors-plus"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/co-authors-plus.zip")
sha512sums=('f358e4a8f00938f0f573f6bcdeaa74b74906a0bf13802a38ccb8ae24d8b08cab5cdc36203cda41f8778ffe04f491196b15237eeab2bd466ea6f8896be68d15de')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/co-authors-plus" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
