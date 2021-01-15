# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=wordpress-plugin-opengraph
pkgver=1.10.0
pkgrel=1
pkgdesc="Open Graph plugin for WordPress"
arch=('any')
url="https://github.com/willnorris/wordpress-opengraph"
license=('MIT')
depends=('wordpress')
makedepends=()
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.wordpress.org/plugin/opengraph.${pkgver}.zip")
sha512sums=('dc2ec294d65bc5d38766ff9e136712bee1ff3f9d5221ddb90a81d4878f48c4d0e79270c2a80ceb165088f786396e3631e91a35498652670e046ce012aee06a3f')

package() {
  install -d "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins"
  cp -ra "${srcdir}/opengraph" "${pkgdir}/usr/share/webapps/wordpress/wp-content/plugins/"
}
