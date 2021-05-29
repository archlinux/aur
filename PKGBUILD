# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-co-authors-plus
pkgver=3.4.6
pkgrel=1
pkgdesc="Assign multiple bylines to posts, pages, and custom post types"
arch=('any')
url="https://wordpress.org/plugins/co-authors-plus"
license=('unknown')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/co-authors-plus.zip")
sha512sums=('d14f052ae0a20caf9e23101f378b2a416cdd1fb55dd2be0fe6ad4f80ba6e301b43ff463ab93dc8f68205d5fee3e3fd7deb1d286b3a5e1b314cbe3fb408cc7310')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/co-authors-plus" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
